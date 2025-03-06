import 'package:integrations_controller/src/domain/core/request_action_object.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/common_devices_scenes_presets_for_devices.dart';

class DateAreaActions {
  List<RequestActionObject> dateEntityActions(
    String entityId,
    EntityTypes entityType,
  ) {
    switch (entityType) {
      case EntityTypes.light:
        return CommonDevicesScenesPresetsForDevices.lightOffPreset(entityId);
      case EntityTypes.dimmableLight:
        return CommonDevicesScenesPresetsForDevices.lightCustomBrightnessPreset(
          entityId,
          15,
        );
      case EntityTypes.rgbwLights:
        final List<RequestActionObject> actionsList = [];
        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.rgbCustomColorPreset(
            entityId,
            hue: 24,
            saturation: 1.0,
          ),
        );
        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.lightHalfBrightnessPreset(
            entityId,
          ),
        );
        return actionsList;
      case EntityTypes.smartPlug:
        return CommonDevicesScenesPresetsForDevices.smartPlugOffPreset(
          entityId,
        );
      case EntityTypes.smartTV:
        return CommonDevicesScenesPresetsForDevices.smartTvOffPreset(entityId);
      case EntityTypes.switch_:
        return CommonDevicesScenesPresetsForDevices.switchOffPreset(entityId);
      case EntityTypes.smartComputer:
        return CommonDevicesScenesPresetsForDevices.smartComputerSuspend(
          entityId,
        );
      case EntityTypes.blinds:
      case EntityTypes.ac:
      case EntityTypes.pingEntity:
      case EntityTypes.emptyEntity:
      case EntityTypes.undefined:
      case EntityTypes.securityCamera:
      case EntityTypes.boiler:
      case EntityTypes.printer:
        return [];
    }
  }
}
