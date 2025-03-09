import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_switch_entity/generic_switch_value_objects.dart';
import 'package:integrations_controller/src/infrastructure/core/utils.dart';
import 'package:integrations_controller/src/infrastructure/devices/tasmota/tasmota_ip/tasmota_ip_api/tasmota_ip_api_components.dart';
import 'package:integrations_controller/src/infrastructure/devices/tasmota/tasmota_ip/tasmota_ip_switch/tasmota_ip_switch_entity.dart';

class TasmotaIpHelpers {
  static Future<HashMap<String, DeviceEntityBase>> addDiscoveredDevice(
    DeviceEntityBase entity,
  ) async {
    // TODO: Create list of CoreUniqueId and populate it with all the
    //  components saved devices that already exist
    final List<String> componentsInDevice =
        await getAllComponentsOfDevice(entity);

    final HashMap<String, DeviceEntityBase> entityToAdd = HashMap();

    for (int counter = 0; counter < componentsInDevice.length; counter++) {
      final String componentInDeviceNumberLabel = componentsInDevice[counter];
      final DeviceEntityBase? deviceEntity = await addDeviceByTasmotaType(
        componentInDeviceNumberLabel: componentInDeviceNumberLabel,
        entity: entity,
      );
      if (deviceEntity != null) {
        entityToAdd.addEntries([
          MapEntry(deviceEntity.entityCbjUniqueId.getOrCrash(), deviceEntity),
        ]);
      }
    }

    return entityToAdd;
  }

  static Future<DeviceEntityBase?> addDeviceByTasmotaType({
    required String componentInDeviceNumberLabel,
    required DeviceEntityBase entity,
  }) async {
    final String? deviceHostName = entity.deviceHostName.getOrCrash();

    if (deviceHostName == null || deviceHostName.isEmpty) {
      return null;
    }

    final int componentInDeviceNumberLabelAsInt =
        int.parse(componentInDeviceNumberLabel);

    if (!gpioOverviewTasmota.keys.contains(componentInDeviceNumberLabelAsInt) ||
        gpioOverviewTasmota[componentInDeviceNumberLabelAsInt]!.length < 2) {
      icLogger.w(
        'Tasmota ip does not contain this key, you can add more in [gpioOverviewTasmota]',
      );
      return null;
    }
    final List<String>? componentInDeviceUiLabelAndComment =
        gpioOverviewTasmota[componentInDeviceNumberLabelAsInt];
    final String entityCbjUniqueId =
        '$deviceHostName-$componentInDeviceNumberLabel}';
    if (componentInDeviceNumberLabelAsInt == 0) {
      // UI Label: None
      return null;
    } else if (componentInDeviceNumberLabelAsInt >= 32 &&
        componentInDeviceNumberLabelAsInt <= 39) {
      // UI Label: Button
    } else if (componentInDeviceNumberLabelAsInt >= 64 &&
        componentInDeviceNumberLabelAsInt <= 71) {
      // UI Label: Button_n
    } else if (componentInDeviceNumberLabelAsInt >= 96 &&
        componentInDeviceNumberLabelAsInt <= 103) {
      // UI Label: Button_i
    } else if (componentInDeviceNumberLabelAsInt >= 224 &&
        componentInDeviceNumberLabelAsInt <= 251) {
      // UI Label: Relay
      return TasmotaIpSwitchEntity(
        uniqueId: entity.uniqueId,
        entityUniqueId: EntityUniqueId(
          '$deviceHostName-$componentInDeviceNumberLabel}',
        ),
        cbjEntityName: CbjEntityName(
          value: '$deviceHostName-${componentInDeviceUiLabelAndComment![0]}',
        ),
        entityOriginalName: EntityOriginalName(
          '$deviceHostName-${componentInDeviceUiLabelAndComment[0]}',
        ),
        deviceOriginalName: DeviceOriginalName(
          value: '$deviceHostName-${componentInDeviceUiLabelAndComment[0]}',
        ),
        entityStateGRPC: entity.entityStateGRPC,
        senderDeviceOs: entity.senderDeviceOs,
        deviceVendor: entity.deviceVendor,
        deviceNetworkLastUpdate: entity.deviceNetworkLastUpdate,
        senderDeviceModel: entity.senderDeviceModel,
        senderId: entity.senderId,
        compUuid: entity.compUuid,
        stateMassage: entity.stateMassage,
        powerConsumption: entity.powerConsumption,
        switchState: GenericSwitchSwitchState(EntityActions.off.toString()),
        deviceHostName: DeviceHostName(value: deviceHostName),
        deviceLastKnownIp: entity.deviceLastKnownIp,
        deviceUniqueId: entity.deviceUniqueId,
        devicePort: entity.devicePort,
        deviceMdns: entity.deviceMdns,
        srvResourceRecord: entity.srvResourceRecord,
        srvTarget: entity.srvTarget,
        ptrResourceRecord: entity.ptrResourceRecord,
        mdnsServiceType: entity.mdnsServiceType,
        devicesMacAddress: entity.devicesMacAddress,
        entityKey: entity.entityKey,
        requestTimeStamp: entity.requestTimeStamp,
        lastResponseFromDeviceTimeStamp: entity.lastResponseFromDeviceTimeStamp,
        entityCbjUniqueId: CoreUniqueId.fromUniqueString(entityCbjUniqueId),
      );
    } else if (componentInDeviceNumberLabelAsInt >= 256 &&
        componentInDeviceNumberLabelAsInt <= 283) {
      // UI Label: Relay_i
    } else if (componentInDeviceNumberLabelAsInt >= 288 &&
        componentInDeviceNumberLabelAsInt <= 291) {
      // UI Label: Led
    } else if (componentInDeviceNumberLabelAsInt >= 320 &&
        componentInDeviceNumberLabelAsInt <= 323) {
      // UI Label: Led_i
    }

    icLogger.i(
      'Please add new Tasmota device type ${componentInDeviceUiLabelAndComment![0]}',
    );
    return null;
  }

  /// Getting all of the components/gpio configuration of the device.
  /// Doc of all components: https://tasmota.github.io/docs/Components/#tasmota
  static Future<List<String>> getAllComponentsOfDevice(
    DeviceEntityBase entity,
  ) async {
    final String? deviceIp = entity.devicesMacAddress.getOrCrash();
    const String getComponentsCommand = 'cm?cmnd=Gpio';

    Map<String, Map<String, String>>? responseJson;
    final List<String> componentTypeAndName = [];

    try {
      final Response response =
          await get(Uri.parse('http://$deviceIp/$getComponentsCommand'));
      final Map<String, dynamic> temp1ResponseJson =
          json.decode(response.body) as Map<String, dynamic>;

      final Map<String, Map<String, dynamic>> temp2ResponseJson =
          temp1ResponseJson.map(
        (key, value) => MapEntry(key, value as Map<String, dynamic>),
      );

      responseJson = temp2ResponseJson.map(
        (key, Map<String, dynamic> value) => MapEntry(
          key,
          value.map(
            (key, value) {
              final MapEntry<String, String> tempEntry =
                  MapEntry(key, value.toString());
              componentTypeAndName.add(key);
              return tempEntry;
            },
          ),
        ),
      );
    } catch (e) {
      icLogger.e(e);
    }
    if (responseJson == null || responseJson.isEmpty) {
      return [];
    }
    return componentTypeAndName;
  }
}
