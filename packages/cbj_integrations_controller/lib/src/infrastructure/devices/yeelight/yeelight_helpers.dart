import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_value_objects.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/yeelight/yeelight_1se/yeelight_1se_entity.dart';
import 'package:yeedart/yeedart.dart';

class YeelightHelpers {
  static HashMap<String, DeviceEntityBase> addDiscoveredDevice({
    required DiscoveryResponse yeelightDevice,
    required DeviceEntityBase entity,
  }) {
    final HashMap<String, DeviceEntityBase> entitiesMap = HashMap();

    String deviceName;
    final String? deviceMdns = entity.deviceMdns.getOrCrash();

    if (yeelightDevice.name != null && yeelightDevice.name!.isNotEmpty) {
      deviceName = yeelightDevice.name!;
    } else if (deviceMdns != null) {
      if (deviceMdns.contains('-')) {
        deviceName = deviceMdns.split('-').first;
      } else {
        deviceName = entity.deviceMdns.getOrCrash()!;
      }
    } else {
      deviceName = entity.cbjEntityName.getOrCrash()!;
    }

    if (yeelightDevice.model == null) {
      return entitiesMap;
    }

    final String entityCbjUniqueId = yeelightDevice.id.toString();

    if (yeelightDevice.model == 'color4' || yeelightDevice.model == 'colora') {
      final DeviceEntityBase newEntity = Yeelight1SeEntity(
        uniqueId: entity.uniqueId,
        entityUniqueId: EntityUniqueId(yeelightDevice.id.toString()),
        cbjEntityName: CbjEntityName(value: deviceName),
        entityOriginalName: EntityOriginalName(deviceName),
        deviceOriginalName: DeviceOriginalName(value: deviceName),
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
        deviceLastKnownIp:
            DeviceLastKnownIp(value: yeelightDevice.address.address),
        stateMassage: entity.stateMassage,
        powerConsumption: entity.powerConsumption,
        devicePort: DevicePort(value: yeelightDevice.port.toString()),
        deviceUniqueId: entity.deviceUniqueId,
        deviceHostName: entity.deviceHostName,
        devicesMacAddress: entity.devicesMacAddress,
        entityKey: entity.entityKey,
        requestTimeStamp: entity.requestTimeStamp,
        lastResponseFromDeviceTimeStamp: entity.lastResponseFromDeviceTimeStamp,
        entityCbjUniqueId: CoreUniqueId.fromUniqueString(entityCbjUniqueId),
        lightSwitchState:
            GenericRgbwLightSwitchState(yeelightDevice.powered.toString()),
        lightColorTemperature: GenericRgbwLightColorTemperature(
          yeelightDevice.colorTemperature.toString(),
        ),
        lightBrightness:
            GenericRgbwLightBrightness(yeelightDevice.brightness.toString()),
        lightColorAlpha: GenericRgbwLightColorAlpha('1.0'),
        lightColorHue: GenericRgbwLightColorHue(yeelightDevice.hue.toString()),
        lightColorSaturation: GenericRgbwLightColorSaturation(
          yeelightDevice.sat == null
              ? '1'
              : percentageToDecimal(yeelightDevice.sat!).toString(),
        ),
        lightColorValue: GenericRgbwLightColorValue('1.0'),
        colorMode: GenericLightModeState(
          yeelightDevice.colorMode == 3 ? ColorMode.rgb : ColorMode.white,
        ),
      );
      entitiesMap.addEntries([MapEntry(entityCbjUniqueId, newEntity)]);
    } else {
      icLogger.i(
        'Please add new Yeelight device type ${yeelightDevice.model}',
      );
    }

    return entitiesMap;
  }

  static HashMap<String, DeviceEntityBase>
      addDiscoveredDeviceByYeelightResponse(DiscoveryResponse yeelightDevice) {
    final HashMap<String, DeviceEntityBase> entitiesMap = HashMap();

    if (yeelightDevice.model == null) {
      return entitiesMap;
    }

    final String entityCbjUniqueId = yeelightDevice.id.toString();

    if (yeelightDevice.model == 'color4' || yeelightDevice.model == 'colora') {
      String deviceName = 'Yeelight bulbe';
      if (yeelightDevice.name != null && yeelightDevice.name!.isNotEmpty) {
        deviceName = yeelightDevice.name!;
      }

      final DeviceEntityBase newEntity = Yeelight1SeEntity(
        uniqueId: CoreUniqueId(),
        entityUniqueId: EntityUniqueId(yeelightDevice.id.toString()),
        cbjEntityName: CbjEntityName(value: deviceName),
        entityOriginalName: EntityOriginalName(deviceName),
        deviceOriginalName: DeviceOriginalName(value: deviceName),
        entityStateGRPC: EntityState(EntityStateGRPC.ack),
        senderDeviceOs: DeviceSenderDeviceOs(''),
        deviceVendor: DeviceVendor(value: ''),
        deviceNetworkLastUpdate: DeviceNetworkLastUpdate(value: ''),
        senderDeviceModel: DeviceSenderDeviceModel(''),
        senderId: DeviceSenderId(),
        compUuid: DeviceCompUuid(''),
        deviceMdns: DeviceMdns(),
        srvResourceRecord: DeviceSrvResourceRecord(),
        srvTarget: DeviceSrvTarget(),
        ptrResourceRecord: DevicePtrResourceRecord(),
        mdnsServiceType: DeviceMdnsServiceType(),
        deviceLastKnownIp:
            DeviceLastKnownIp(value: yeelightDevice.address.address),
        stateMassage: DeviceStateMassage(value: ''),
        powerConsumption: DevicePowerConsumption(''),
        devicePort: DevicePort(value: yeelightDevice.port.toString()),
        deviceUniqueId: DeviceUniqueId(''),
        deviceHostName: DeviceHostName(),
        devicesMacAddress: DevicesMacAddress(),
        entityKey: EntityKey(''),
        requestTimeStamp: RequestTimeStamp(''),
        lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp(''),
        entityCbjUniqueId: CoreUniqueId.fromUniqueString(entityCbjUniqueId),
        lightSwitchState:
            GenericRgbwLightSwitchState(yeelightDevice.powered.toString()),
        lightColorTemperature: GenericRgbwLightColorTemperature(
          yeelightDevice.colorTemperature.toString(),
        ),
        lightBrightness:
            GenericRgbwLightBrightness(yeelightDevice.brightness.toString()),
        lightColorAlpha: GenericRgbwLightColorAlpha('1.0'),
        lightColorHue: GenericRgbwLightColorHue(yeelightDevice.hue.toString()),
        lightColorSaturation: GenericRgbwLightColorSaturation(
          yeelightDevice.sat.toString(),
        ),
        lightColorValue: GenericRgbwLightColorValue('1.0'),
        colorMode: GenericLightModeState(
          yeelightDevice.colorMode == 3 ? ColorMode.rgb : ColorMode.white,
        ),
      );
      entitiesMap.addEntries([MapEntry(entityCbjUniqueId, newEntity)]);
    } else {
      icLogger.i(
        'Please add new Yeelight device type ${yeelightDevice.model}',
      );
    }

    return entitiesMap;
  }
}
