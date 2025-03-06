import { Environment, StorageService, Time } from "@matter/main";
import { BasicInformationCluster, GeneralCommissioning, OnOff, DescriptorCluster } from "@matter/main/clusters";
import { ManualPairingCodeCodec, QrPairingCodeCodec, NodeId } from "@matter/main/types";
import { CommissioningController, NodeCommissioningOptions } from "@project-chip/matter.js";
import { NodeStates, PairedNode } from "@project-chip/matter.js/device";
import { loggerService} from "../../services/logger_service";
import { EntityActions, EntityStateGRPC, EntityTypes, VendorsAndServices } from "../../../domain/from_dart/request_action_types";
import { RequestActionObject } from "../../../domain/from_dart/request_action_object";
import { DeviceEntityNotAbstract } from "../../../domain/from_dart/device_entity_base";
import { simpleClusters } from "./matter_enums";
import { EntityProperties } from "../../../domain/from_dart/entity_type_utils";


// type CommissioningOptions = {
//     ip: string;
//     port: number;
//     pairingCode: string;
// };

export class MatterAPI {
    static _instance: any;
    private environment = Environment.default;
    private  storageService = this.environment.get(StorageService);
    private commissioningController!: CommissioningController;
  

    constructor() {
        if (MatterAPI._instance) {
          return MatterAPI._instance
        }
        MatterAPI._instance = this;
      }

    async start() {
        const controllerStorage = (await this.storageService.open("controller")).createContext("data");

        const uniqueId = (await controllerStorage.has("uniqueid"))
            ? await controllerStorage.get<string>("uniqueid")
            : (this.environment.vars.string("uniqueid") ?? Time.nowMs().toString());
        await controllerStorage.set("uniqueid", uniqueId);


        this. commissioningController = new CommissioningController({
            environment: {
                environment: this.environment,
                id: uniqueId ??   Time.nowMs().toString(),
            },
            autoConnect: true,
        });

        await this.commissioningController.start();
        loggerService.log("Matter API started");
    }

    async commissionDevice( pairingCode: string) : Promise<NodeId> {
        const nodeOptions = this.createCommissioningOptions(pairingCode);
        loggerService.log(`Commissioning... ${JSON.stringify(nodeOptions)}`);
        const nodeId = await this.commissioningController.commissionNode(nodeOptions);
        loggerService.log(`Commissioning completed with nodeId ${nodeId}`);
        return nodeId;
    }

    private createCommissioningOptions(pairingCode: string): NodeCommissioningOptions {

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
                    ? { longDiscriminator : pcData.discriminator }
                    : manualPairing?.shortDiscriminator !== undefined
                      ? { shortDiscriminator :  manualPairing.shortDiscriminator }
                      : {},
                discoveryCapabilities: {
                    ble : false,
                },
            },
            passcode: pcData.passcode,
        };
    }


    async getCommissioneDevices(){
       return this.commissioningController.getCommissionedNodes()
    }

    async setDeviceOnOff(nodeIdN: bigint | number, state: boolean) {
        const conn = await this.commissioningController.connectNode(NodeId(nodeIdN));
        const device = conn.getDevices()[0];
        const onOff = device?.getClusterClient(OnOff.Complete);
        if (onOff) {
            return state ? await onOff.on() : await onOff.off();
        }
        throw new Error("OnOff cluster not found");
    }

    async listenForChanges(nodeIdN: bigint | number) {
        const conn = await this.commissioningController.connectNode(NodeId(nodeIdN));
        conn.events.attributeChanged.on(({ path, value }) => {
            loggerService.log(`Attribute changed: ${path.nodeId}/${path.clusterId}/${path.attributeName} -> ${value}`);
        });
        conn.events.stateChanged.on(state => {
            loggerService.log(`State changed: ${NodeStates[state]}`);
        });
    }

    async setStateByAction(requestAction: RequestActionObject){
        if(requestAction.actionType === EntityActions.On){
            requestAction.entityIds.forEach(async (id) => {
              const numericId = BigInt(id);
              await this.setDeviceOnOff(numericId, true);
            });
          }
          if(requestAction.actionType === EntityActions.Off){
            requestAction.entityIds.forEach(async (id) => {
              const numericId = BigInt(id);
              await this.setDeviceOnOff(numericId, false);
            });
          }
    }


    async getEntitiesForId(id: NodeId ) : Promise<DeviceEntityNotAbstract[]> {
   
        const node = await this.commissioningController.connectNode(NodeId(id));
        const info = node.getRootClusterClient(BasicInformationCluster);
        const productName = await info?.getProductNameAttribute();
        const vendorName = await info?.getVendorNameAttribute();
        // TODO: check if the device name is on the structure
        const descriptor = node.getRootClusterClient(DescriptorCluster);
        const deviceType = await this.getTypesForNode(node);

        const entity = new DeviceEntityNotAbstract();
        entity.entityStateGRPC = EntityStateGRPC.AddNewEntityFromJavascriptHub;
        // TODO: Might be several types from the same device in the future, would get returnd as defferent entities.
        entity.entityTypes = deviceType;
        entity.deviceVendor = vendorName ??'';
        entity.deviceOriginalName = productName??'';
        entity.uniqueId = node.nodeId.toString();
        entity.cbjDeviceVendor = VendorsAndServices.Matter;
        

        return [entity];
    }

    async getTypesForNode(node: PairedNode): Promise<EntityTypes>{
        const devices = node.getDevices();
        const clusterListObj = devices[0].getAllClusterClients();
        const clusterList : number[] = [];
        clusterListObj.forEach((c) => {
            clusterList.push(c.id);
        });
        
        let deviceType = EntityTypes.Undefined;

        // TODO: Use the enum simpleClusters for th evalues
        if(clusterList.includes(6) ){
            if( clusterList.includes(8)){
                deviceType = EntityTypes.DimmableLight;
            } else {
                deviceType = EntityTypes.Light;
            }
        }
        return deviceType;
    }
}


export const matterAPI = new MatterAPI();
