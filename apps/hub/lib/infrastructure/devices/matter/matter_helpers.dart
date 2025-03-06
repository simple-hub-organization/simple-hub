import 'dart:collection';

import 'package:hub/infrastructure/devices/matter/matter_entities/matter_dimmable_light_entity.dart';
import 'package:integrations_controller/integrations_controller.dart';

class MatterHelpers {
  static Future<HashMap<String, DeviceEntityBase>> addDiscoveredDevice(
    DeviceEntityBase entity,
  ) async {
    if (entity is GenericDimmableLightDE) {
      final MatterDimmableLightEntity matterDE = MatterDimmableLightEntity(
        uniqueId: entity.uniqueId,
        entityUniqueId: entity.entityUniqueId,
        cbjEntityName: entity.cbjEntityName,
        entityOriginalName: entity.entityOriginalName,
        deviceOriginalName: entity.deviceOriginalName,
        entityStateGRPC: EntityState(EntityStateGRPC.ack),
        senderDeviceOs: entity.senderDeviceOs,
        deviceVendor: entity.deviceVendor,
        deviceNetworkLastUpdate: entity.deviceNetworkLastUpdate,
        senderDeviceModel: entity.senderDeviceModel,
        senderId: entity.senderId,
        compUuid: entity.compUuid,
        deviceMdns: entity.deviceMdns,
        srvResourceRecord: entity.srvResourceRecord,
        srvTarget: entity.srvTarget,
        ptrResourceRecord: entity.ptrResourceRecord,
        mdnsServiceType: entity.mdnsServiceType,
        deviceLastKnownIp: entity.deviceLastKnownIp,
        stateMassage: entity.stateMassage,
        powerConsumption: entity.powerConsumption,
        devicePort: entity.devicePort,
        deviceUniqueId: entity.deviceUniqueId,
        deviceHostName: entity.deviceHostName,
        devicesMacAddress: entity.devicesMacAddress,
        entityKey: entity.entityKey,
        requestTimeStamp: entity.requestTimeStamp,
        lastResponseFromDeviceTimeStamp: entity.lastResponseFromDeviceTimeStamp,
        entityCbjUniqueId: entity.entityCbjUniqueId,
        lightSwitchState: entity.lightSwitchState,
        lightBrightness: entity.lightBrightness,
      );

      return HashMap()
        ..addEntries([
          MapEntry(entity.entityCbjUniqueId.getOrCrash(), matterDE),
        ]);
    }
    return HashMap();
  }
}
