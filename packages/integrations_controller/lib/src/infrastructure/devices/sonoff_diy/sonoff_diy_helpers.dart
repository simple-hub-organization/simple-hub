import 'dart:collection';

import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_switch_entity/generic_switch_value_objects.dart';
import 'package:integrations_controller/src/infrastructure/core/utils.dart';
import 'package:integrations_controller/src/infrastructure/devices/sonoff_diy/sonoff__diy_wall_switch/sonoff_diy_mod_wall_switch_entity.dart';

class SonoffDiyHelpers {
  static Future<HashMap<String, DeviceEntityBase>> addDiscoveredDevice(
    DeviceEntityBase entity,
  ) async {
    final String? mDnsName = entity.deviceMdns.getOrCrash();
    final String? port = entity.devicePort.getOrCrash();
    final String? ip = entity.deviceLastKnownIp.getOrCrash();

    final HashMap<String, DeviceEntityBase> entitiesToAdd = HashMap();

    if (mDnsName == null || port == null || ip == null) {
      return entitiesToAdd;
    }

    try {
      if (mDnsName.contains('sonoffDiy1-C45BBE78005D')) {
        final String entityCbjUniqueId = mDnsName;

        final SonoffDiyRelaySwitchEntity sonoffDiyRelaySwitchEntity =
            SonoffDiyRelaySwitchEntity(
          uniqueId: entity.uniqueId,
          entityUniqueId: EntityUniqueId(mDnsName),
          cbjEntityName: CbjEntityName(value: mDnsName),
          entityOriginalName: EntityOriginalName(mDnsName),
          deviceOriginalName: DeviceOriginalName(value: mDnsName),
          entityStateGRPC: entity.entityStateGRPC,
          senderDeviceOs: entity.senderDeviceOs,
          deviceVendor: entity.deviceVendor,
          deviceNetworkLastUpdate: entity.deviceNetworkLastUpdate,
          senderDeviceModel: DeviceSenderDeviceModel('d1'),
          senderId: entity.senderId,
          compUuid: entity.compUuid,
          stateMassage: entity.stateMassage,
          powerConsumption: entity.powerConsumption,
          devicePort: DevicePort(value: port),
          deviceHostName: DeviceHostName(value: mDnsName.toLowerCase()),
          deviceMdns: DeviceMdns(value: mDnsName),
          srvResourceRecord: entity.srvResourceRecord,
          srvTarget: entity.srvTarget,
          ptrResourceRecord: entity.ptrResourceRecord,
          mdnsServiceType: entity.mdnsServiceType,
          deviceLastKnownIp: DeviceLastKnownIp(value: ip),
          switchState: GenericSwitchSwitchState(false.toString()),
          deviceUniqueId: entity.deviceUniqueId,
          devicesMacAddress: entity.devicesMacAddress,
          entityKey: entity.entityKey,
          requestTimeStamp: entity.requestTimeStamp,
          lastResponseFromDeviceTimeStamp:
              entity.lastResponseFromDeviceTimeStamp,
          entityCbjUniqueId: CoreUniqueId.fromUniqueString(entityCbjUniqueId),
        );
        entitiesToAdd.addEntries([
          MapEntry(entityCbjUniqueId, sonoffDiyRelaySwitchEntity),
        ]);
      } else {
        icLogger.i('SonoffDiy device types is not supported');
      }
    } catch (e) {
      icLogger.e('Error setting SonoffDiy\n$e');
    }

    return entitiesToAdd;
  }
}
