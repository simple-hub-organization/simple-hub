import 'dart:collection';

import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_switch_entity/generic_switch_value_objects.dart';
import 'package:integrations_controller/src/infrastructure/devices/ewelink/ewelink_switch/ewelink_switch_entity.dart';
import 'package:dart_ewelink_api/dart_ewelink_api.dart';

class EwelinkHelpers {
  static HashMap<String, DeviceEntityBase> addDiscoveredDevice(
    EwelinkDevice ewelinkDevice,
  ) {
    final HashMap<String, DeviceEntityBase> addEntities = HashMap();

    DeviceEntityBase? tempDevice;
    String? entityCbjUniqueId;

    if (ewelinkDevice.type == 'a9') {
      entityCbjUniqueId = '${ewelinkDevice.deviceid}-${ewelinkDevice.deviceid}';

      tempDevice = EwelinkSwitchEntity(
        uniqueId: CoreUniqueId(),
        entityUniqueId: EntityUniqueId(ewelinkDevice.deviceid),
        cbjEntityName: CbjEntityName(value: ewelinkDevice.name),
        entityOriginalName: EntityOriginalName(ewelinkDevice.name),
        deviceOriginalName: DeviceOriginalName(value: ewelinkDevice.name),
        stateMassage: DeviceStateMassage(value: 'ok'),
        senderDeviceOs: DeviceSenderDeviceOs('EweLink'),
        deviceVendor: DeviceVendor(),
        deviceNetworkLastUpdate: DeviceNetworkLastUpdate(),
        senderDeviceModel: DeviceSenderDeviceModel(ewelinkDevice.type),
        senderId: DeviceSenderId(),
        deviceUniqueId: DeviceUniqueId(ewelinkDevice.deviceid),
        devicePort: DevicePort(value: ''),
        deviceLastKnownIp: DeviceLastKnownIp(value: ''),
        deviceHostName: DeviceHostName(value: '0'),
        deviceMdns: DeviceMdns(value: '0'),
        srvResourceRecord: DeviceSrvResourceRecord(),
        mdnsServiceType: DeviceMdnsServiceType(),
        ptrResourceRecord: DevicePtrResourceRecord(),
        srvTarget: DeviceSrvTarget(),
        compUuid: DeviceCompUuid('empty'),
        powerConsumption: DevicePowerConsumption('0'),
        devicesMacAddress: DevicesMacAddress(value: '0'),
        // TODO: Fix because we can't use the outlet number from entityUniqueId
        entityKey: EntityKey('1'),
        requestTimeStamp: RequestTimeStamp('0'),
        lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp('0'),
        entityCbjUniqueId: CoreUniqueId.fromUniqueString(entityCbjUniqueId),
        switchState: GenericSwitchSwitchState('off'),
        entityStateGRPC: EntityState.state(EntityStateGRPC.ack),
      );
    } else if (ewelinkDevice.type == '10') {
      final List<Map<String, dynamic>> mapOfSwitches =
          ewelinkDevice.params.switches!;

      final Map<String, dynamic>? possibleTags =
          ewelinkDevice.tags?.entityNames;

      for (int i = 0; i < mapOfSwitches.length - 1; i++) {
        final Map<String, dynamic> switchParam = mapOfSwitches[i];
        final String outletNumber = (switchParam['outlet'] as int).toString();

        String tagName = '${ewelinkDevice.name} outlet $outletNumber';

        if (possibleTags != null) {
          if (i <= possibleTags.length - 1) {
            tagName = possibleTags[i.toString()] as String;
          } else {
            // Device can have multiple switches, the device is purpose for 4
            // switches inside of it even if this is a unit of 2.
            // So we return only switch with names because unused switches on the
            // device does not have name (tag)
            continue;
          }
        }
        // else {
        //   // Devices without tags at all are legit and will be added only once
        // }
        entityCbjUniqueId =
            '${ewelinkDevice.deviceid}-${ewelinkDevice.deviceid}-$outletNumber';

        tempDevice = EwelinkSwitchEntity(
          uniqueId: CoreUniqueId(),
          // TODO: This is temp fix, if there are multiple outlet with the
          //  same number for example 0 then only the last one will be
          //  displayed without this fix as they are not unique enough and get
          // override somewhere in the process.
          entityUniqueId:
              EntityUniqueId('${ewelinkDevice.deviceid}-$outletNumber'),
          cbjEntityName: CbjEntityName(
            value: tagName,
          ),
          entityOriginalName: EntityOriginalName(
            tagName,
          ),
          deviceOriginalName: DeviceOriginalName(value: ewelinkDevice.name),
          stateMassage: DeviceStateMassage(value: 'ok'),
          senderDeviceOs: DeviceSenderDeviceOs('EweLink'),

          deviceVendor: DeviceVendor(),
          deviceNetworkLastUpdate: DeviceNetworkLastUpdate(),
          senderDeviceModel: DeviceSenderDeviceModel(ewelinkDevice.type),
          senderId: DeviceSenderId(),
          deviceUniqueId: DeviceUniqueId(ewelinkDevice.deviceid),
          devicePort: DevicePort(value: ''),
          deviceLastKnownIp: DeviceLastKnownIp(value: ''),
          deviceHostName: DeviceHostName(value: '0'),
          deviceMdns: DeviceMdns(value: '0'),
          srvResourceRecord: DeviceSrvResourceRecord(),
          mdnsServiceType: DeviceMdnsServiceType(),
          ptrResourceRecord: DevicePtrResourceRecord(),
          srvTarget: DeviceSrvTarget(),
          compUuid: DeviceCompUuid('empty'),
          powerConsumption: DevicePowerConsumption('0'),
          devicesMacAddress: DevicesMacAddress(value: '0'),
          // TODO: Fix because we can't use the outlet number from entityUniqueId
          entityKey: EntityKey(outletNumber),
          requestTimeStamp: RequestTimeStamp('0'),
          lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp('0'),
          entityCbjUniqueId: CoreUniqueId.fromUniqueString(entityCbjUniqueId),
          switchState:
              GenericSwitchSwitchState(switchParam['switch'] as String),
          entityStateGRPC: EntityState.state(EntityStateGRPC.ack),
        );
        if (possibleTags == null) {
          break;
        }
      }
    }

    if (tempDevice != null && entityCbjUniqueId != null) {
      addEntities.addEntries([MapEntry(entityCbjUniqueId, tempDevice)]);
    }
    return addEntities;
  }
}
