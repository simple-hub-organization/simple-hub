import 'package:cbj_integrations_controller/src/domain/core/request_action_object.dart';
import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/common_devices_scenes_presets_for_devices.dart';

class RestAreaActions {
  List<RequestActionObject> restEntityActions(
    String entityId,
    EntityTypes entityType,
  ) {
    switch (entityType) {
      case EntityTypes.blinds:
        return CommonDevicesScenesPresetsForDevices.blindsUpPreset(entityId);
      case EntityTypes.light:
        return CommonDevicesScenesPresetsForDevices.lightOnPreset(entityId);
      case EntityTypes.dimmableLight:
        return CommonDevicesScenesPresetsForDevices.lightMaxBrightnessPreset(
          entityId,
        );
      case EntityTypes.rgbwLights:
        final List<RequestActionObject> actionsList = [];
        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.rgbLightOrangePreset(entityId),
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
