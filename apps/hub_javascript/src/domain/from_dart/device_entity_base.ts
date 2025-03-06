import { v4 as uuidv4 } from 'uuid';
import { EntityActions, EntityStateGRPC, EntityTypes, VendorsAndServices } from './request_action_types';
import { EntityProperties } from './entity_type_utils';


abstract class DeviceEntityBase {
  uniqueId: string;
  entityUniqueId: string;
  cbjEntityName: string;
  entityOriginalName: string;
  deviceOriginalName: string;
  entityStateGRPC: EntityStateGRPC;
  stateMassage: string;
  senderDeviceOs: string;
  senderDeviceModel: string;
  senderId: string;
  entityTypes: EntityTypes;
  cbjDeviceVendor: VendorsAndServices;
  deviceVendor: string;
  deviceNetworkLastUpdate: string;
  compUuid: string;
  powerConsumption: string;
  deviceUniqueId: string;
  devicePort: string;
  deviceLastKnownIp: string;
  deviceHostName: string;
  deviceMdns: string;   
  srvResourceRecord: any;
  srvTarget: any;
  ptrResourceRecord: any;
  mdnsServiceType: string;
  devicesMacAddress: string;
  entityKey: string;
  requestTimeStamp: string;
  lastResponseFromDeviceTimeStamp: string;
  entityCbjUniqueId: string;
  constructor({
  uniqueId,
  entityUniqueId,
  cbjEntityName,
  entityOriginalName,
  deviceOriginalName,
  entityStateGRPC,
  stateMassage,
  senderDeviceOs,
  senderDeviceModel,
  senderId,
  entityTypes,
  cbjDeviceVendor,
  deviceVendor,
  deviceNetworkLastUpdate,
  compUuid,
  powerConsumption,
  deviceUniqueId,
  devicePort,
  deviceLastKnownIp,
  deviceHostName,
  deviceMdns,
  srvResourceRecord,
  srvTarget,
  ptrResourceRecord,
  mdnsServiceType,
  devicesMacAddress,
  entityKey,
  requestTimeStamp,
  lastResponseFromDeviceTimeStamp,
  entityCbjUniqueId,
}: {  uniqueId: string;
    entityUniqueId: string;
    cbjEntityName: string;
    entityOriginalName: string;
    deviceOriginalName: string;
    entityStateGRPC: EntityStateGRPC;
    stateMassage: string;
    senderDeviceOs: string;
    senderDeviceModel: string;
    senderId: string;
    entityTypes: EntityTypes;
    cbjDeviceVendor: VendorsAndServices;
    deviceVendor: string;
    deviceNetworkLastUpdate: string;
    compUuid: string;
    powerConsumption: string;
    deviceUniqueId: string;
    devicePort: string;
    deviceLastKnownIp: string;
    deviceHostName: string;
    deviceMdns: string;
    srvResourceRecord: any;
    srvTarget: any;
    ptrResourceRecord: any;
    mdnsServiceType: string;
    devicesMacAddress: string;
    entityKey: string;
    requestTimeStamp: string;
    lastResponseFromDeviceTimeStamp: string;
    entityCbjUniqueId: string;
}) {
this.uniqueId = uniqueId;
this.entityUniqueId = entityUniqueId;
this.cbjEntityName = cbjEntityName;
this.entityOriginalName = entityOriginalName;
this.deviceOriginalName = deviceOriginalName;
this.entityStateGRPC = entityStateGRPC;
this.stateMassage = stateMassage;
this.senderDeviceOs = senderDeviceOs;
this.senderDeviceModel = senderDeviceModel;
this.senderId = senderId;
this.entityTypes = entityTypes;
this.cbjDeviceVendor = cbjDeviceVendor;
this.deviceVendor = deviceVendor;
this.deviceNetworkLastUpdate = deviceNetworkLastUpdate;
this.compUuid = compUuid;
this.powerConsumption = powerConsumption;
this.deviceUniqueId = deviceUniqueId;
this.devicePort = devicePort;
this.deviceLastKnownIp = deviceLastKnownIp;
this.deviceHostName = deviceHostName;
this.deviceMdns = deviceMdns;
this.srvResourceRecord = srvResourceRecord;
this.srvTarget = srvTarget;
this.ptrResourceRecord = ptrResourceRecord;
this.mdnsServiceType = mdnsServiceType;
this.devicesMacAddress = devicesMacAddress;
this.entityKey = entityKey;
this.requestTimeStamp = requestTimeStamp;
this.lastResponseFromDeviceTimeStamp = lastResponseFromDeviceTimeStamp;
this.entityCbjUniqueId = entityCbjUniqueId;
}

get getCbjEntityId() {
  return this.entityCbjUniqueId;
}

//   toInfrastructure() {
//     return new DeviceEntityDtoBase();
//   }

// executeAction(request: string): Promise<any> {
// console.error(
// `ExecuteAction is not implemented for device ${this._currentDeviceInfo} property ${request.property.name} action ${request.action.name} value ${request.values}`,
// );
// return Promise.reject(new Error('Unexpected error'));
// }

get _currentDeviceInfo() {
return `cbjDeviceVendor ${this.cbjDeviceVendor} entityTypes ${this.entityTypes}`;
}

pleaseOverrideMessage() {
console.warn(`Please override this method in the non-generic implementation ${this._currentDeviceInfo}`);
return {
failedValue: 'Action needs to be overridden',
};
}

getAllValidActions(): string[] {
return [];
}

replaceActionIfExist(action: string): boolean {
return false;
}

getListOfPropertiesToChange(): string[] {
return [];
}

// isPropertyAndActionCanBePreform({
// property,
// action,
// }: {
// property: EntityProperties;
// action: EntityActions;
// }): boolean {
// if (!this.getListOfPropertiesToChange().includes(property)) {
// console.error(`Entity type ${this.entityTypes} does not contain property ${property}`);
// return false;
// }

// if (!property.containsAction(action)) {
// console.error(`Entity type ${this.entityTypes} property ${property.name} does not contain actionType ${action.name}`);
// return false;
// }
// return true;
// }

backToDecimalPointBrightness(value: number): number {
const oldMax = 100;
const oldMin = 0;
const oldRange = oldMax - oldMin;

const newMax = 1.0;
const newMin = 0;
const newRange = newMax - newMin;

return ((value - oldMin) * newRange) / oldRange + newMin;
}

//   async wakeOnLan() {
//     await GeneralApiUtils.wakeOnLan(this.devicesMacAddress, this.deviceLastKnownIp);
//   }

minDurationBetweenRequsts = 50;
lastRequest?: Date;

maxRequestsStack = 5;
_requestsQueue: string[] = [];

get isRequestsQueueEmpty() {
return this._requestsQueue.length === 0;
}

get popFirstRequestsQueue() {
return this._requestsQueue.shift();
}

//   addRequestInStack(request: EntitySingleRequest) {
//     if (this._requestsQueue.length > this.maxRequestsStack) {
//       this._requestsQueue.pop();
//       this._requestsQueue.push(request);
//       return;
//     }

//     this._requestsQueue.push(request);

//     if (this._requestsQueue.length > 1) {
//       return;
//     }

//     setInterval(() => {
//       if (this._requestsQueue.length === 0) {
//         clearInterval();
//         return;
//       }
//       this.executeAction(this._requestsQueue.shift());
//       if (this._requestsQueue.length === 0) {
//         clearInterval();
//       }
//     }, this.minDurationBetweenRequsts);
//   }

//   canActivateAction(request: EntitySingleRequest): boolean {
//     const tempActiveAction = !this.lastRequest || new Date().getTime() - this.lastRequest.getTime() > this.minDurationBetweenRequsts;
//     if (tempActiveAction) {
//       this.lastRequest = new Date();
//     } else {
//       this.addRequestInStack(request);
//     }
//     return tempActiveAction;
//   }
}

export class DeviceEntityNotAbstract extends DeviceEntityBase {
    constructor() {
    super({
    uniqueId: uuidv4(),
    entityUniqueId: 'Entity unique id is empty',
    cbjDeviceVendor: VendorsAndServices.Undefined,
    entityStateGRPC: EntityStateGRPC.Ack,
    compUuid: uuidv4(),
    cbjEntityName: 'Cbj entity Name is empty',
    entityOriginalName: 'Entity original name is empty',
    deviceOriginalName: 'Entity original name that entity is exists on is empty',
    entityTypes: EntityTypes.Light,
    senderDeviceModel: 'a',
    senderDeviceOs: 'b',
    senderId: '',
    stateMassage: 'go',
    powerConsumption: '0',
    deviceUniqueId: 'Entity unique id is empty',
    devicePort: '1',
    deviceLastKnownIp: '1.1.1.1',
    deviceHostName: 'deviceHostName is empty',
    deviceMdns: 'deviceMdns is empty',
    srvResourceRecord: {},
    srvTarget: {},
    ptrResourceRecord: {},
    mdnsServiceType: '',
    devicesMacAddress: 'devicesMacAddress is empty',
    entityKey: 'entityKey is empty',
    requestTimeStamp: 'requestTimeStamp is empty',
    lastResponseFromDeviceTimeStamp: 'lastResponseFromDeviceTimeStamp is empty',
    entityCbjUniqueId: uuidv4(),
    deviceVendor: 'undefined',
    deviceNetworkLastUpdate: 'undefined',
    });
    }

    //   toInfrastructure() {
    //     return new DeviceEntityDtoBase();
    //   }

    getAllValidActions(): string[] {
    return [];
    }

    replaceActionIfExist(action: string): boolean {
    return false;
    }

    getListOfPropertiesToChange(): string[] {
    return [];
    }

    toJSON() {
        return {
        uniqueId: this.uniqueId,
        // For detos
        id: this.uniqueId,
        entityUniqueId: this.entityUniqueId,
        cbjEntityName: this.cbjEntityName,
        entityOriginalName: this.entityOriginalName,
        deviceOriginalName: this.deviceOriginalName,
        entityStateGRPC: this.entityStateGRPC,
        stateMassage: this.stateMassage,
        senderDeviceOs: this.senderDeviceOs,
        senderDeviceModel: this.senderDeviceModel,
        senderId: this.senderId,
        entityTypes: this.entityTypes,
        cbjDeviceVendor: this.cbjDeviceVendor,
        deviceVendor: this.deviceVendor,
        deviceNetworkLastUpdate: this.deviceNetworkLastUpdate,
        compUuid: this.compUuid,
        powerConsumption: this.powerConsumption,
        deviceUniqueId: this.deviceUniqueId,
        devicePort: this.devicePort,
        deviceLastKnownIp: this.deviceLastKnownIp,
        deviceHostName: this.deviceHostName,
        deviceMdns: this.deviceMdns,
        srvResourceRecord: this.srvResourceRecord.toString(),
        srvTarget: this.srvTarget.toString(),
        ptrResourceRecord: this.ptrResourceRecord.toString(),
        mdnsServiceType: this.mdnsServiceType,
        devicesMacAddress: this.devicesMacAddress,
        entityKey: this.entityKey,
        requestTimeStamp: this.requestTimeStamp,
        lastResponseFromDeviceTimeStamp: this.lastResponseFromDeviceTimeStamp,
        entityCbjUniqueId: this.entityCbjUniqueId,
        };
    }
}

