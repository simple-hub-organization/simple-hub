import { Environment, StorageService, Time } from "@matter/main";
import { BasicInformationCluster, GeneralCommissioning, OnOff, DescriptorCluster } from "@matter/main/clusters";
import { ManualPairingCodeCodec, QrPairingCodeCodec, NodeId } from "@matter/main/types";
import { CommissioningController } from "@project-chip/matter.js";
import { NodeStates, PairedNode } from "@project-chip/matter.js/device";
import { loggerService } from "../../services/logger_service.js";
import { EntityActions, EntityStateGRPC, EntityTypes, VendorsAndServices } from "../../../domain/from_dart/request_action_types.js";
import { RequestActionObject } from "../../../domain/from_dart/request_action_object.js";
import { DeviceEntityNotAbstract } from "../../../domain/from_dart/device_entity_base.js";
import { simpleClusters } from "./matter_enums.js";
import { EntityProperties } from "../../../domain/from_dart/entity_type_utils.js";

export class MatterAPI {
    static _instance;
    environment = Environment.default;
    storageService = this.environment.get(StorageService);
    commissioningController;

    constructor() {
        if (MatterAPI._instance) {
          return MatterAPI._instance;
        }
        MatterAPI._instance = this;
    }

    async start() {
        const controllerStorage = (await this.storageService.open("controller")).createContext("data");

        const uniqueId = (await controllerStorage.has("uniqueid"))
            ? await controllerStorage.get("uniqueid")
            : (this.environment.vars.string("uniqueid") ?? Time.nowMs().toString());
        await controllerStorage.set("uniqueid", uniqueId);

        this.commissioningController = new CommissioningController({
            environment: {
                environment: this.environment,
                id: uniqueId ?? Time.nowMs().toString(),
            },
            autoConnect: true,
        });

        await this.commissioningController.start();
        loggerService.log("Matter API started");
    }

    async commissionDevice(pairingCode) {
        const nodeOptions = this.createCommissioningOptions(pairingCode);
        loggerService.log(`Commissioning... ${JSON.stringify(nodeOptions)}`);
        const nodeId = await this.commissioningController.commissionNode(nodeOptions);
        loggerService.log(`Commissioning completed with nodeId ${nodeId}`);
        return nodeId;
    }

    createCommissioningOptions(pairingCode) {
        let re = new RegExp("MT:.*");
        let pcData;
        let manualPairing;
        if (re.test(pairingCode)) {
            pcData = QrPairingCodeCodec.decode(pairingCode)[0];
        } else {
            manualPairing = ManualPairingCodeCodec.decode(pairingCode);
            pcData = manualPairing;
        }
        
        return {
            commissioning: {
                regulatoryLocation: GeneralCommissioning.RegulatoryLocationType.IndoorOutdoor,
                regulatoryCountryCode: "XX",
            },
            discovery: {
                identifierData:
                    pcData.discriminator !== undefined
                    ? { longDiscriminator: pcData.discriminator }
                    : manualPairing?.shortDiscriminator !== undefined
                      ? { shortDiscriminator: manualPairing.shortDiscriminator }
                      : {},
                discoveryCapabilities: {
                    ble: false,
                },
            },
            passcode: pcData.passcode,
        };
    }

    async getCommissioneDevices() {
       return this.commissioningController.getCommissionedNodes();
    }

    async setDeviceOnOff(nodeIdN, state) {
        const conn = await this.commissioningController.connectNode(NodeId(nodeIdN));
        const device = conn.getDevices()[0];
        const onOff = device?.getClusterClient(OnOff.Complete);
        if (onOff) {
            return state ? await onOff.on() : await onOff.off();
        }
        throw new Error("OnOff cluster not found");
    }

    async listenForChanges(nodeIdN) {
        const conn = await this.commissioningController.connectNode(NodeId(nodeIdN));
        conn.events.attributeChanged.on(({ path, value }) => {
            loggerService.log(`Attribute changed: ${path.nodeId}/${path.clusterId}/${path.attributeName} -> ${value}`);
        });
        conn.events.stateChanged.on(state => {
            loggerService.log(`State changed: ${NodeStates[state]}`);
        });
    }

    async setStateByAction(requestAction) {
        if(requestAction.actionType === EntityActions.On) {
            requestAction.entityIds.forEach(async (id) => {
              const numericId = BigInt(id);
              await this.setDeviceOnOff(numericId, true);
            });
        }
        if(requestAction.actionType === EntityActions.Off) {
            requestAction.entityIds.forEach(async (id) => {
              const numericId = BigInt(id);
              await this.setDeviceOnOff(numericId, false);
            });
        }
    }

    async getEntitiesForId(id) {
        const node = await this.commissioningController.connectNode(NodeId(id));
        const info = node.getRootClusterClient(BasicInformationCluster);
        const productName = await info?.getProductNameAttribute();
        const vendorName = await info?.getVendorNameAttribute();
        const descriptor = node.getRootClusterClient(DescriptorCluster);
        const deviceType = await this.getTypesForNode(node);

        const entity = new DeviceEntityNotAbstract();
        entity.entityStateGRPC = EntityStateGRPC.AddNewEntityFromJavascriptHub;
        entity.entityTypes = deviceType;
        entity.deviceVendor = vendorName ?? '';
        entity.deviceOriginalName = productName ?? '';
        entity.uniqueId = node.nodeId.toString();
        entity.cbjDeviceVendor = VendorsAndServices.Matter;

        return [entity];
    }

    async getTypesForNode(node) {
        const devices = node.getDevices();
        const clusterListObj = devices[0].getAllClusterClients();
        const clusterList = [];
        clusterListObj.forEach((c) => {
            clusterList.push(c.id);
        });
        
        let deviceType = EntityTypes.Undefined;

        if(clusterList.includes(6)) {
            if(clusterList.includes(8)) {
                deviceType = EntityTypes.DimmableLight;
            } else {
                deviceType = EntityTypes.Light;
            }
        }
        return deviceType;
    }
}

export const matterAPI = new MatterAPI(); 