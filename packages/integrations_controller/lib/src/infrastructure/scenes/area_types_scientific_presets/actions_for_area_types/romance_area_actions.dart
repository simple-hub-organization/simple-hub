import 'package:integrations_controller/src/domain/core/request_action_object.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/common_devices_scenes_presets_for_devices.dart';

class RomanceAreaActions {
  List<RequestActionObject> romanceEntityActions(
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
          CommonDevicesScenesPresetsForDevices.lightHalfBrightnessPreset(
            entityId,
          ),
        );

        int counter = 0;
        const Duration delay = Duration(seconds: 10);
        const Duration transitionDuration = Duration(seconds: 9);

        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.rgbCustomColorPreset(
            entityId,
            hue: 282,
            saturation: 0.91,
            transitionDuration: transitionDuration,
          ),
        );

        actionsList.addAll(
          CommonDevicesScenesPresetsForDevices.lightHalfBrightnessPreset(
            entityId,
          ),
        );

        while (counter < 10) {
          actionsList.addAll(
            CommonDevicesScenesPresetsForDevices.rgbCustomColorPreset(
              entityId,
              hue: 282,
              saturation: 0.91,
              transitionDuration: transitionDuration,
            ),
          );
          actionsList.addAll(
            CommonDevicesScenesPresetsForDevices.customDelay(
              entityId,
              delay,
            ),
          );
          actionsList.addAll(
            CommonDevicesScenesPresetsForDevices.rgbCustomColorPreset(
              entityId,
              hue: 307,
              saturation: 0.67,
              transitionDuration: transitionDuration,
            ),
          );
          actionsList.addAll(
            CommonDevicesScenesPresetsForDevices.customDelay(
              entityId,
              delay,
            ),
          );
          counter++;
        }
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
