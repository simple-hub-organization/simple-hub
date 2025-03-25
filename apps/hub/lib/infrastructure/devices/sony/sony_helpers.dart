import 'dart:collection';

import 'package:hub/infrastructure/devices/sony/sony_entities/sony_bravia_smart_tv_entity.dart';
import 'package:integrations_controller/integrations_controller.dart';

class SonyHelpers {
  static Future<HashMap<String, DeviceEntityBase>> addDiscoveredDevice(
    DeviceEntityBase entity,
  ) async {
    if (entity is GenericSmartTvDE) {
      final SonyBraviaSmartTvEntity sonyDE = SonyBraviaSmartTvEntity(
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
        smartTvSwitchState: entity.smartTvSwitchState,
      );

      VendorsConnectorConjecture().moreInformationForEntity.add(sonyDE);
      Future.delayed(const Duration(minutes: 5), () {
        VendorsConnectorConjecture()
            .moreInformationForEntity
            .removeWhere((entity) {
          if (entity.entityCbjUniqueId.getOrCrash() ==
              sonyDE.entityCbjUniqueId.getOrCrash()) {
            return true;
          }
          return false;
        });
      });

      return HashMap()
        ..addEntries([
          MapEntry(entity.entityCbjUniqueId.getOrCrash(), sonyDE),
        ]);
    }
    return HashMap();
  }
}
