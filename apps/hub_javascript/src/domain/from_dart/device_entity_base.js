import { v4 as uuidv4 } from 'uuid';
import { EntityActions, EntityStateGRPC, EntityTypes, VendorsAndServices } from './request_action_types.js';
import { EntityProperties } from './entity_type_utils.js';

class DeviceEntityBase {
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

  get _currentDeviceInfo() {
    return `cbjDeviceVendor ${this.cbjDeviceVendor} entityTypes ${this.entityTypes}`;
  }

  pleaseOverrideMessage() {
    console.warn(`Please override this method in the non-generic implementation ${this._currentDeviceInfo}`);
    return {
      failedValue: 'Action needs to be overridden',
    };
  }

  getAllValidActions() {
    return [];
  }

  replaceActionIfExist(action) {
    return false;
  }

  getListOfPropertiesToChange() {
    return [];
  }

  backToDecimalPointBrightness(value) {
    const oldMax = 100;
    const oldMin = 0;
    const oldRange = oldMax - oldMin;

    const newMax = 1.0;
    const newMin = 0;
    const newRange = newMax - newMin;

    return ((value - oldMin) * newRange) / oldRange + newMin;
  }

  minDurationBetweenRequsts = 50;
  maxRequestsStack = 5;
  _requestsQueue = [];

  get isRequestsQueueEmpty() {
    return this._requestsQueue.length === 0;
  }

  get popFirstRequestsQueue() {
    return this._requestsQueue.shift();
  }
}

export class DeviceEntityNotAbstract extends DeviceEntityBase {
  constructor() {
    super({
      uniqueId: uuidv4(),
      entityUniqueId: uuidv4(),
      cbjEntityName: '',
      entityOriginalName: '',
      deviceOriginalName: '',
      entityStateGRPC: EntityStateGRPC.Undefined,
      stateMassage: '',
      senderDeviceOs: '',
      senderDeviceModel: '',
      senderId: '',
      entityTypes: EntityTypes.Undefined,
      cbjDeviceVendor: VendorsAndServices.Undefined,
      deviceVendor: '',
      deviceNetworkLastUpdate: '',
      compUuid: uuidv4(),
      powerConsumption: '',
      deviceUniqueId: '',
      devicePort: '',
      deviceLastKnownIp: '',
      deviceHostName: '',
      deviceMdns: '',
      srvResourceRecord: null,
      srvTarget: null,
      ptrResourceRecord: null,
      mdnsServiceType: '',
      devicesMacAddress: '',
      entityKey: '',
      requestTimeStamp: '',
      lastResponseFromDeviceTimeStamp: '',
      entityCbjUniqueId: uuidv4(),
    });
  }

  getAllValidActions() {
    return [];
  }

  replaceActionIfExist(action) {
    return false;
  }

  getListOfPropertiesToChange() {
    return [];
  }

  toJSON() {
    return {
      uniqueId: this.uniqueId,
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
      srvResourceRecord: this.srvResourceRecord,
      srvTarget: this.srvTarget,
      ptrResourceRecord: this.ptrResourceRecord,
      mdnsServiceType: this.mdnsServiceType,
      devicesMacAddress: this.devicesMacAddress,
      entityKey: this.entityKey,
      requestTimeStamp: this.requestTimeStamp,
      lastResponseFromDeviceTimeStamp: this.lastResponseFromDeviceTimeStamp,
      entityCbjUniqueId: this.entityCbjUniqueId,
    };
  }
} 