import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_blinds_entity/generic_blinds_entity.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_blinds_entity/generic_blinds_value_objects.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_boiler_entity/generic_boiler_entity.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_boiler_entity/generic_boiler_value_objects.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_smart_plug_entity/generic_smart_plug_entity.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_smart_plug_entity/generic_smart_plug_value_objects.dart';
import 'package:integrations_controller/src/infrastructure/core/utils.dart';
import 'package:integrations_controller/src/infrastructure/devices/switcher/switcher_entities/switcher_runner_entity.dart';
import 'package:integrations_controller/src/infrastructure/devices/switcher/switcher_entities/switcher_smart_plug_entity.dart';
import 'package:integrations_controller/src/infrastructure/devices/switcher/switcher_entities/switcher_v2_entity.dart';
import 'package:switcher_dart/switcher_dart.dart';

class SwitcherHelpers {
  static DeviceEntityBase? addDiscoveredDevice(
    SwitcherApiObject switcherDevice,
  ) {
    if (switcherDevice.deviceType == SwitcherDevicesTypes.switcherRunner ||
        switcherDevice.deviceType == SwitcherDevicesTypes.switcherRunnerMini) {
      EntityActions deviceActions = EntityActions.undefined;

      if (switcherDevice.deviceDirection == SwitcherDeviceDirection.up) {
        deviceActions = EntityActions.moveUp;
      } else if (switcherDevice.deviceDirection ==
          SwitcherDeviceDirection.stop) {
        deviceActions = EntityActions.stop;
      } else if (switcherDevice.deviceDirection ==
          SwitcherDeviceDirection.down) {
        deviceActions = EntityActions.moveDown;
      }

      final SwitcherRunnerEntity switcherRunnerDe = SwitcherRunnerEntity(
        uniqueId: CoreUniqueId(),
        entityUniqueId: EntityUniqueId(switcherDevice.deviceId),
        cbjEntityName: CbjEntityName(value: switcherDevice.switcherName),
        entityOriginalName: EntityOriginalName(switcherDevice.switcherName),
        deviceOriginalName:
            DeviceOriginalName(value: switcherDevice.switcherName),
        entityStateGRPC: EntityState.state(EntityStateGRPC.ack),
        senderDeviceOs: DeviceSenderDeviceOs('switcher'),
        deviceVendor: DeviceVendor(),
        deviceNetworkLastUpdate: DeviceNetworkLastUpdate(),
        senderDeviceModel:
            DeviceSenderDeviceModel(switcherDevice.deviceType.toString()),
        senderId: DeviceSenderId(),
        compUuid: DeviceCompUuid('34asdfrsd23gggg'),
        deviceLastKnownIp: DeviceLastKnownIp(value: switcherDevice.switcherIp),
        stateMassage: DeviceStateMassage(value: 'Hello World'),
        powerConsumption:
            DevicePowerConsumption(switcherDevice.powerConsumption),
        devicePort: DevicePort(value: switcherDevice.port.toString()),
        devicesMacAddress: DevicesMacAddress(value: switcherDevice.macAddress),
        blindsSwitchState: GenericBlindsSwitchState(
          deviceActions.toString(),
        ),
        deviceUniqueId: DeviceUniqueId('0'),
        deviceHostName: DeviceHostName(value: '0'),
        deviceMdns: DeviceMdns(),
        srvResourceRecord: DeviceSrvResourceRecord(),
        mdnsServiceType: DeviceMdnsServiceType(),
        ptrResourceRecord: DevicePtrResourceRecord(),
        srvTarget: DeviceSrvTarget(),
        entityKey: EntityKey('0'),
        requestTimeStamp: RequestTimeStamp('0'),
        lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp('0'),
        entityCbjUniqueId:
            CoreUniqueId.fromUniqueString(switcherDevice.deviceId),
      );

      return switcherRunnerDe;
    } else if (switcherDevice.deviceType == SwitcherDevicesTypes.switcherMini ||
        switcherDevice.deviceType == SwitcherDevicesTypes.switcherTouch ||
        switcherDevice.deviceType == SwitcherDevicesTypes.switcherV2Esp ||
        switcherDevice.deviceType == SwitcherDevicesTypes.switcherV2qualcomm ||
        switcherDevice.deviceType == SwitcherDevicesTypes.switcherV4) {
      EntityActions deviceActions = EntityActions.undefined;
      if (switcherDevice.deviceState == SwitcherDeviceState.on) {
        deviceActions = EntityActions.on;
      } else if (switcherDevice.deviceState == SwitcherDeviceState.off) {
        deviceActions = EntityActions.off;
      }
      final SwitcherV2Entity switcherV2De = SwitcherV2Entity(
        uniqueId: CoreUniqueId(),
        entityUniqueId: EntityUniqueId(switcherDevice.deviceId),
        cbjEntityName: CbjEntityName(value: switcherDevice.switcherName),
        entityOriginalName: EntityOriginalName(switcherDevice.switcherName),
        deviceOriginalName:
            DeviceOriginalName(value: switcherDevice.switcherName),
        entityStateGRPC: EntityState.state(EntityStateGRPC.ack),
        senderDeviceOs: DeviceSenderDeviceOs('switcher'),
        deviceVendor: DeviceVendor(),
        deviceNetworkLastUpdate: DeviceNetworkLastUpdate(),
        senderDeviceModel:
            DeviceSenderDeviceModel(switcherDevice.deviceType.toString()),
        senderId: DeviceSenderId(),
        compUuid: DeviceCompUuid('34asdfrsd23gggg'),
        deviceLastKnownIp: DeviceLastKnownIp(value: switcherDevice.switcherIp),
        stateMassage: DeviceStateMassage(value: 'Hello World'),
        powerConsumption:
            DevicePowerConsumption(switcherDevice.powerConsumption),
        boilerSwitchState: GenericBoilerSwitchState(deviceActions.toString()),
        devicePort: DevicePort(value: switcherDevice.port.toString()),
        devicesMacAddress: DevicesMacAddress(value: switcherDevice.macAddress),
        deviceUniqueId: DeviceUniqueId('0'),
        deviceHostName: DeviceHostName(value: '0'),
        deviceMdns: DeviceMdns(),
        srvResourceRecord: DeviceSrvResourceRecord(),
        mdnsServiceType: DeviceMdnsServiceType(),
        ptrResourceRecord: DevicePtrResourceRecord(),
        srvTarget: DeviceSrvTarget(),
        entityKey: EntityKey('0'),
        requestTimeStamp: RequestTimeStamp('0'),
        lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp('0'),
        entityCbjUniqueId:
            CoreUniqueId.fromUniqueString(switcherDevice.deviceId),
      );

      return switcherV2De;
    } else if (switcherDevice.deviceType ==
        SwitcherDevicesTypes.switcherPowerPlug) {
      EntityActions deviceActions = EntityActions.undefined;
      if (switcherDevice.deviceState == SwitcherDeviceState.on) {
        deviceActions = EntityActions.on;
      } else if (switcherDevice.deviceState == SwitcherDeviceState.off) {
        deviceActions = EntityActions.off;
      }
      final SwitcherSmartPlugEntity switcherSmartPlugDe =
          SwitcherSmartPlugEntity(
        uniqueId: CoreUniqueId(),
        entityUniqueId: EntityUniqueId(switcherDevice.deviceId),
        cbjEntityName: CbjEntityName(value: switcherDevice.switcherName),
        entityOriginalName: EntityOriginalName(switcherDevice.switcherName),
        deviceOriginalName:
            DeviceOriginalName(value: switcherDevice.switcherName),
        entityStateGRPC: EntityState.state(EntityStateGRPC.ack),
        senderDeviceOs: DeviceSenderDeviceOs('switcher'),
        deviceVendor: DeviceVendor(),
        deviceNetworkLastUpdate: DeviceNetworkLastUpdate(),
        senderDeviceModel:
            DeviceSenderDeviceModel(switcherDevice.deviceType.toString()),
        senderId: DeviceSenderId(),
        compUuid: DeviceCompUuid('34asdfrsd23gggg'),
        deviceLastKnownIp: DeviceLastKnownIp(value: switcherDevice.switcherIp),
        stateMassage: DeviceStateMassage(value: 'Hello World'),
        powerConsumption:
            DevicePowerConsumption(switcherDevice.powerConsumption),
        smartPlugState: GenericSmartPlugState(deviceActions.toString()),
        deviceUniqueId: DeviceUniqueId('0'),
        devicePort: DevicePort(value: switcherDevice.port.toString()),
        deviceHostName: DeviceHostName(value: '0'),
        deviceMdns: DeviceMdns(),
        srvResourceRecord: DeviceSrvResourceRecord(),
        mdnsServiceType: DeviceMdnsServiceType(),
        ptrResourceRecord: DevicePtrResourceRecord(),
        srvTarget: DeviceSrvTarget(),
        devicesMacAddress: DevicesMacAddress(value: switcherDevice.macAddress),
        entityKey: EntityKey('0'),
        requestTimeStamp: RequestTimeStamp('0'),
        lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp('0'),
        entityCbjUniqueId:
            CoreUniqueId.fromUniqueString(switcherDevice.deviceId),
      );

      return switcherSmartPlugDe;
    }

    icLogger.i(
      'Please add new Switcher device type ${switcherDevice.deviceType}',
    );
    return null;
  }

  static DeviceEntityBase? entityToType(DeviceEntityBase entity) {
    if (entity is GenericBoilerDE) {
      return SwitcherV2Entity.fromGeneric(entity);
    } else if (entity is GenericSmartPlugDE) {
      return SwitcherSmartPlugEntity.fromGeneric(entity);
    } else if (entity is SwitcherV2Entity) {
      return SwitcherV2Entity.fromGeneric(entity);
    } else if (entity is GenericBlindsDE) {
      return SwitcherRunnerEntity.fromGeneric(entity);
    }

    return null;
  }
}
