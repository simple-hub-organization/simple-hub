import 'dart:collection';

import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_smart_tv_entity/generic_smart_tv_value_objects.dart';
import 'package:integrations_controller/src/infrastructure/devices/google/chrome_cast/chrome_cast_entity.dart';

class GoogleHelpers {
  static Future<HashMap<String, DeviceEntityBase>> addDiscoveredDevice(
    DeviceEntityBase entity,
  ) async {
    final String entityCbjUniqueId = entity.devicesMacAddress.getOrCrash() ??
        entity.deviceMdns.getOrCrash()!;
    String name;
    final String? deviceMdns = entity.deviceMdns.getOrCrash();
    final String? srvTarget = entity.srvTarget.getOrCrash();
    if (deviceMdns != null && deviceMdns.contains('-')) {
      name = deviceMdns.split('-').first;
    } else if (srvTarget != null) {
      name = srvTarget;
    } else {
      name = entity.cbjEntityName.getOrCrash() ?? '';
    }

    final ChromeCastEntity googleDE = ChromeCastEntity(
      uniqueId: entity.uniqueId,
      entityUniqueId: EntityUniqueId(deviceMdns),
      cbjEntityName: CbjEntityName(value: name),
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
      entityCbjUniqueId: CoreUniqueId.fromUniqueString(entityCbjUniqueId),
      smartTvSwitchState: GenericSmartTvSwitchState(
        EntityActions.undefined.toString(),
      ),
    );

    return HashMap()
      ..addEntries([
        MapEntry(entityCbjUniqueId, googleDE),
      ]);
  }
}
