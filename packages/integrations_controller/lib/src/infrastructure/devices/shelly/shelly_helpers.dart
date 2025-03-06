import 'dart:collection';
import 'dart:convert';

import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_value_objects.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_switch_entity/generic_switch_value_objects.dart';
import 'package:integrations_controller/src/infrastructure/core/utils.dart';
import 'package:integrations_controller/src/infrastructure/devices/shelly/shelly_light/shelly_light_entity.dart';
import 'package:integrations_controller/src/infrastructure/devices/shelly/shelly_relay_switch/shelly_relay_switch_entity.dart';
import 'package:color/color.dart';
import 'package:shelly/shelly.dart';

class ShellyHelpers {
  static Future<HashMap<String, DeviceEntityBase>> addDiscoveredDevice(
    DeviceEntityBase entity,
  ) async {
    final String ip = entity.deviceLastKnownIp.getOrCrash()!;
    final String mDnsName = entity.deviceMdns.getOrCrash()!;
    final String? hostName = entity.deviceHostName.getOrCrash();

    final HashMap<String, DeviceEntityBase> entitiesToAdd = HashMap();
    final String entityCbjUniqueId = mDnsName;
    DeviceEntityBase? tempEntity;
    try {
      // TODO: shelly duo bulb needs type that as the time of writing is
      // not supported, bulb + brightness + white temperature (not rgb).
      // Lets create new type and add it.
      if (mDnsName.contains('colorbulb')) {
        final ShellyApiColorBulb shellyApiDeviceAbstract = ShellyApiColorBulb(
          lastKnownIp: ip,
          mDnsName: mDnsName,
          hostName: hostName,
        );

        final String status = await shellyApiDeviceAbstract.getStatus();
        final dynamic responseAsJson = json.decode(status);

        // ignore: avoid_dynamic_calls
        final String mac = responseAsJson['mac'] as String;
        // ignore: avoid_dynamic_calls
        final dynamic bulbLightProp = responseAsJson['lights'][0];
        // ignore: avoid_dynamic_calls
        final String bulbMod = bulbLightProp['mode'] as String;
        shellyApiDeviceAbstract.bulbMode =
            bulbMod == 'color' ? ShellyBulbMode.colore : ShellyBulbMode.white;
        // ignore: avoid_dynamic_calls
        final int brightness = bulbLightProp['brightness'] as int;
        final int gain =
            // ignore: avoid_dynamic_calls
            bulbLightProp['gain'] as int; // Brightness for color mod
        final int currentBrightness =
            shellyApiDeviceAbstract.bulbMode == ShellyBulbMode.colore
                ? gain
                : brightness;
        // ignore: avoid_dynamic_calls
        final int temp = bulbLightProp['temp'] as int;
        // ignore: avoid_dynamic_calls
        final int red = bulbLightProp['red'] as int;
        // ignore: avoid_dynamic_calls
        final int green = bulbLightProp['green'] as int;
        // ignore: avoid_dynamic_calls
        final int blue = bulbLightProp['blue'] as int;

        final RgbColor rgbColor = RgbColor(red, green, blue);
        final HsvColor hsvColor = rgbColor.toHsvColor();

        // ignore: avoid_dynamic_calls
        final bool isOn = bulbLightProp['ison'] as bool;

        tempEntity = ShellyColorLightEntity(
          uniqueId: entity.uniqueId,
          entityUniqueId: EntityUniqueId(mDnsName),
          cbjEntityName: entity.cbjEntityName,
          entityOriginalName: entity.entityOriginalName,
          deviceOriginalName: entity.deviceOriginalName,
          entityStateGRPC: entity.entityStateGRPC,
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
          devicesMacAddress: DevicesMacAddress(value: mac),
          entityKey: entity.entityKey,
          requestTimeStamp: entity.requestTimeStamp,
          lastResponseFromDeviceTimeStamp:
              entity.lastResponseFromDeviceTimeStamp,
          entityCbjUniqueId: CoreUniqueId.fromUniqueString(entityCbjUniqueId),
          lightSwitchState: GenericRgbwLightSwitchState(isOn ? 'on' : 'off'),
          lightColorTemperature:
              GenericRgbwLightColorTemperature(temp.toString()),
          lightBrightness:
              GenericRgbwLightBrightness(currentBrightness.toString()),
          lightColorAlpha: GenericRgbwLightColorAlpha('1.0'),
          lightColorHue:
              GenericRgbwLightColorHue(hsvColor.h.toInt().toString()),
          lightColorSaturation: GenericRgbwLightColorSaturation(
            decimalToPercentage(percentageToDecimal(hsvColor.s.toInt()))
                .toString(),
          ),
          lightColorValue:
              GenericRgbwLightColorValue(hsvColor.v.toInt().toString()),
          colorMode: GenericLightModeState(ColorMode.white),
        );
      } else if (mDnsName.contains('BulbDuo')) {
        final ShellyApiColorBulb shellyApiDeviceAbstract = ShellyApiColorBulb(
          lastKnownIp: ip,
          mDnsName: mDnsName,
          hostName: hostName,
        );

        final String status = await shellyApiDeviceAbstract.getStatus();
        final dynamic responseAsJson = json.decode(status);

        // ignore: avoid_dynamic_calls
        final String mac = responseAsJson['mac'] as String;

        // ignore: avoid_dynamic_calls
        final dynamic bulbLightProp = responseAsJson['lights'][0];

        shellyApiDeviceAbstract.bulbMode = ShellyBulbMode.white;

        // ignore: avoid_dynamic_calls
        final int brightness = bulbLightProp['brightness'] as int;

        final int currentBrightness = brightness;

        // ignore: avoid_dynamic_calls
        final int temp = bulbLightProp['temp'] as int;

        // ignore: avoid_dynamic_calls
        final bool isOn = bulbLightProp['ison'] as bool;

        tempEntity = ShellyColorLightEntity(
          uniqueId: entity.uniqueId,
          entityUniqueId: EntityUniqueId(mDnsName),
          cbjEntityName: entity.cbjEntityName,
          entityOriginalName: entity.entityOriginalName,
          deviceOriginalName: entity.deviceOriginalName,
          entityStateGRPC: entity.entityStateGRPC,
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
          devicesMacAddress: DevicesMacAddress(value: mac),
          entityKey: entity.entityKey,
          requestTimeStamp: entity.requestTimeStamp,
          lastResponseFromDeviceTimeStamp:
              entity.lastResponseFromDeviceTimeStamp,
          entityCbjUniqueId: CoreUniqueId.fromUniqueString(entityCbjUniqueId),
          lightSwitchState: GenericRgbwLightSwitchState(isOn ? 'on' : 'off'),
          lightColorTemperature:
              GenericRgbwLightColorTemperature(temp.toString()),
          lightBrightness:
              GenericRgbwLightBrightness(currentBrightness.toString()),
          lightColorAlpha: GenericRgbwLightColorAlpha('1.0'),
          lightColorHue: GenericRgbwLightColorHue('0'),
          lightColorSaturation: GenericRgbwLightColorSaturation('0'),
          lightColorValue: GenericRgbwLightColorValue('0'),
          colorMode: GenericLightModeState(ColorMode.white),
        );
      } else if (mDnsName.contains('shelly1')) {
        final ShellyApiRelaySwitch shellyApiDeviceAbstract =
            ShellyApiRelaySwitch(
          lastKnownIp: ip,
          mDnsName: mDnsName,
          hostName: hostName,
        );
        final String status = await shellyApiDeviceAbstract.getStatus();
        final dynamic responseAsJson = json.decode(status);

        // ignore: avoid_dynamic_calls
        final String mac = responseAsJson['mac'] as String;

        tempEntity = ShellyRelaySwitchEntity(
          uniqueId: entity.uniqueId,
          entityUniqueId: EntityUniqueId(mDnsName),
          cbjEntityName: entity.cbjEntityName,
          entityOriginalName: entity.entityOriginalName,
          deviceOriginalName: entity.deviceOriginalName,
          entityStateGRPC: entity.entityStateGRPC,
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
          devicesMacAddress: DevicesMacAddress(value: mac),
          entityKey: entity.entityKey,
          requestTimeStamp: entity.requestTimeStamp,
          lastResponseFromDeviceTimeStamp:
              entity.lastResponseFromDeviceTimeStamp,
          entityCbjUniqueId: CoreUniqueId.fromUniqueString(entityCbjUniqueId),
          switchState: GenericSwitchSwitchState(false.toString()),
        );
      } else {
        icLogger.i('Shelly device types is not supported');
      }
    } catch (e) {
      icLogger.e('Error setting shelly\n$e');
    }

    if (tempEntity != null) {
      entitiesToAdd.addEntries([MapEntry(entityCbjUniqueId, tempEntity)]);
    }

    return entitiesToAdd;
  }
}
