import 'dart:collection';

import 'package:http/http.dart';
import 'package:hue_dart/hue_dart.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_dimmable_light_entity/generic_dimmable_light_value_objects.dart';
import 'package:integrations_controller/src/infrastructure/core/utils.dart';
import 'package:integrations_controller/src/infrastructure/devices/philips_hue/philips_hue_api/philips_hue_api_light.dart';
import 'package:integrations_controller/src/infrastructure/devices/philips_hue/philips_hue_e26/philips_hue_e26_entity.dart';

class PhilipsHueHelpers {
  static Future<HashMap<String, DeviceEntityBase>> addDiscoveredDevice(
    DeviceEntityBase entity,
  ) async {
    final client = Client();

    //create bridge
    final bridge = Bridge(client, entity.deviceLastKnownIp.getOrCrash()!);

    /// TODO: save user phillips hub generated user name for cbj
    final String userNameForPhilipsHueHub =
        await bridge.brideLoopToAwaitPushlinkForUserId();
    bridge.username = userNameForPhilipsHueHub;

    final List<Light> lights = await bridge.lights();

    final HashMap<String, DeviceEntityBase> entitiesToAdd = HashMap();

    for (final Light light in lights) {
      final LightState? lightState = light.state;
      final String? entityCbjUniqueId = light.uniqueId;
      if (entityCbjUniqueId == null) {
        icLogger.e('Philips id is null');
        continue;
      }

      if (light.type != null && light.type == 'Dimmable light') {
        final String deviceName = (light.name != null && light.name != '')
            ? light.name!
            : 'PhilipsHue test 2';

        final PhilipsHueE26Entity philipsHueDE = PhilipsHueE26Entity(
          uniqueId: entity.uniqueId,
          entityUniqueId: EntityUniqueId(light.uniqueId.toString()),
          cbjEntityName: entity.cbjEntityName,
          entityOriginalName: EntityOriginalName(deviceName),
          deviceOriginalName: DeviceOriginalName(value: deviceName),
          entityStateGRPC: entity.entityStateGRPC,
          senderDeviceOs: entity.senderDeviceOs,
          deviceVendor: entity.deviceVendor,
          deviceNetworkLastUpdate: entity.deviceNetworkLastUpdate,
          senderDeviceModel: DeviceSenderDeviceModel(light.modelId),
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
          lastResponseFromDeviceTimeStamp:
              entity.lastResponseFromDeviceTimeStamp,
          entityCbjUniqueId: CoreUniqueId.fromUniqueString(entityCbjUniqueId),
          lightSwitchState: GenericDimmableLightSwitchState(
            lightState != null && lightState.on != null && lightState.on!
                ? EntityActions.on.toString()
                : EntityActions.off.toString(),
          ),
          lightBrightness: GenericDimmableLightBrightness(
            (lightState?.brightness ?? 0).toString(),
          ),
          philipsHueApiLight: PhilipsHueApiLight(
            username: userNameForPhilipsHueHub,
            ipAdress: entity.deviceLastKnownIp.getOrCrash()!,
          ),
        );
        entitiesToAdd.addEntries([
          MapEntry(entityCbjUniqueId, philipsHueDE),
        ]);
      } else {
        icLogger.w('Un supported Philips Hue light type');
      }
    }

    return entitiesToAdd;
  }
}
