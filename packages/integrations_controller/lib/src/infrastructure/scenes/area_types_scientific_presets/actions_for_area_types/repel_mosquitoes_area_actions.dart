import 'package:integrations_controller/src/domain/core/request_action_object.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/common_devices_scenes_presets_for_devices.dart';

class RepelMosquitoesAreaActions {
  List<RequestActionObject> repelMosquitoesEntityActions(
    String entityId,
    EntityTypes entityType,
  ) {
    switch (entityType) {
      case EntityTypes.blinds:
        return CommonDevicesScenesPresetsForDevices.blindsUpPreset(entityId);

      /// Yello and whie repel but we don't have a way to know the light bulbe color
      case EntityTypes.light:
      case EntityTypes.dimmableLight:
        return CommonDevicesScenesPresetsForDevices.lightOffPreset(entityId);
      case EntityTypes.rgbwLights:
        final List<RequestActionObject> actionsList = [];

        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.rgbCustomColorPreset(
            entityId,
            hue: 0,
            saturation: 1.0,
          ),
        );
        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.lightMaxBrightnessPreset(
            entityId,
          ),
        );
        return actionsList;
      case EntityTypes.smartTV:
        return CommonDevicesScenesPresetsForDevices.smartTvOffPreset(entityId);
      case EntityTypes.switch_:
        return CommonDevicesScenesPresetsForDevices.switchOnPreset(entityId);
      case EntityTypes.smartPlug:
      case EntityTypes.pingEntity:
      case EntityTypes.emptyEntity:
      case EntityTypes.undefined:
      case EntityTypes.securityCamera:
      case EntityTypes.boiler:
      case EntityTypes.printer:
      case EntityTypes.smartComputer:
      case EntityTypes.ac:
        return [];
    }
  }
}
