import 'package:integrations_controller/src/domain/core/request_action_object.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/common_devices_scenes_presets_for_devices.dart';

class SleepAreaActions {
  List<RequestActionObject> sleepAreaEntityActions(
    String entityId,
    EntityTypes entityType,
  ) {
    switch (entityType) {
      case EntityTypes.blinds:
        return CommonDevicesScenesPresetsForDevices.blindsDownPreset(entityId);
      case EntityTypes.light:
        return CommonDevicesScenesPresetsForDevices.lightOffPreset(entityId);
      case EntityTypes.dimmableLight:
      case EntityTypes.rgbwLights:
        return CommonDevicesScenesPresetsForDevices.lightOffGradualyPreset(
          entityId,
        );
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
