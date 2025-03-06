import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_object.dart';
import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/entity_type_utils.dart';

class CommonDevicesScenesPresetsForDevices {
  /// Light preset

  static List<RequestActionObject> lightOnPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.lightSwitchState,
          actionType: EntityActions.on,
        ),
      ];

  static List<RequestActionObject> lightOffPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.lightSwitchState,
          actionType: EntityActions.off,
        ),
      ];

  static List<RequestActionObject> lightOffGradualyPreset(String entityId) {
    int brightness = 40;
    const int brightnessReduction = 2;
    const Duration totalActionDuration = Duration(minutes: 10);
    final Duration delayDuration = Duration(
      milliseconds: totalActionDuration.inMilliseconds ~/
          (brightness ~/ brightnessReduction),
    );

    final List<RequestActionObject> requestList = [];

    while (brightness > 0) {
      requestList.add(
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.lightBrightness,
          actionType: EntityActions.useValue,
          value: HashMap.from({ActionValues.brightness: brightness}),
        ),
      );
      requestList.addAll(customDelay(entityId, delayDuration));
      brightness -= brightnessReduction;
    }
    requestList.add(
      RequestActionObject(
        entityIds: HashSet.from([entityId]),
        property: EntityProperties.lightSwitchState,
        actionType: EntityActions.off,
      ),
    );

    return requestList;
  }

  /// Blinds preset

  static List<RequestActionObject> blindsDownPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.blindsSwitchState,
          actionType: EntityActions.moveDown,
        ),
      ];

  static List<RequestActionObject> blindsUpPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.blindsSwitchState,
          actionType: EntityActions.moveUp,
        ),
      ];

  static List<RequestActionObject> blindsStopPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.blindsSwitchState,
          actionType: EntityActions.stop,
        ),
      ];

  /// Boiler preset

  static List<RequestActionObject> boilerOnPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.boilerSwitchState,
          actionType: EntityActions.on,
        ),
      ];

  static List<RequestActionObject> boilerOffPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.boilerSwitchState,
          actionType: EntityActions.off,
        ),
      ];

  /// Switch_ preset

  static List<RequestActionObject> switchOnPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.switchState,
          actionType: EntityActions.on,
        ),
      ];

  static List<RequestActionObject> switchOffPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.switchState,
          actionType: EntityActions.off,
        ),
      ];

  /// RgbwLights preset

  static List<RequestActionObject> rgbLightOrangePreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.lightColorTemperature,
          actionType: EntityActions.changeTemperature,
          value: HashMap.from({ActionValues.colorTemperature: 2500}),
        ),
      ];

  static List<RequestActionObject> rgbLightWhitePreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.lightColorTemperature,
          actionType: EntityActions.changeTemperature,
          value: HashMap.from({ActionValues.colorTemperature: 5400}),
        ),
      ];

  static List<RequestActionObject> rgbLightCustomTempraturePreset(
    String entityId,
    int temperature,
  ) =>
      [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.lightColorTemperature,
          actionType: EntityActions.changeTemperature,
          value: HashMap.from({ActionValues.colorTemperature: temperature}),
        ),
      ];

  static List<RequestActionObject> rgbLightBluePreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.lightColorTemperature,
          actionType: EntityActions.changeTemperature,
          value: HashMap.from({ActionValues.colorTemperature: 8800}),
        ),
      ];

  static List<RequestActionObject> rgbCustomColorPreset(
    String entityId, {
    /// Between 0-360
    required double hue,

    /// Between 0.0-1.0
    required double saturation,
    double alpha = 1,
    double colorValue = 1,
    Duration? transitionDuration,
  }) =>
      [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.lightColorHsvColor,
          actionType: EntityActions.hsvColor,
          value: HashMap.from({
            ActionValues.saturation: saturation,
            ActionValues.hue: hue,
            ActionValues.alpha: alpha,
            ActionValues.colorValue: colorValue,
            ActionValues.transitionDuration: transitionDuration,
          }),
        ),
      ];

  static List<RequestActionObject> lightMaxBrightnessPreset(
    String entityId,
  ) =>
      [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.lightBrightness,
          actionType: EntityActions.useValue,
          value: HashMap.from({ActionValues.brightness: 100}),
        ),
      ];

  static List<RequestActionObject> lightHalfBrightnessPreset(
    String entityId,
  ) =>
      [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.lightBrightness,
          actionType: EntityActions.useValue,
          value: HashMap.from({ActionValues.brightness: 50}),
        ),
      ];

  static List<RequestActionObject> lightCustomBrightnessPreset(
    String entityId,
    int brightness,
  ) =>
      [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.lightBrightness,
          actionType: EntityActions.useValue,
          value: HashMap.from({ActionValues.brightness: brightness}),
        ),
      ];

  static List<RequestActionObject> smartTvOffPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.smartTvSwitchState,
          actionType: EntityActions.off,
        ),
      ];

  static List<RequestActionObject> smartTvOnPreset(
    String entityId,
  ) =>
      [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.smartTvSwitchState,
          actionType: EntityActions.on,
        ),
      ];

  /// SmartPlug preset

  static List<RequestActionObject> smartPlugOnPreset(
    String entityId,
  ) =>
      [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.smartPlugState,
          actionType: EntityActions.on,
        ),
      ];

  static List<RequestActionObject> smartPlugOffPreset(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.smartPlugState,
          actionType: EntityActions.off,
        ),
      ];

  static List<RequestActionObject> smartComputerSuspend(String entityId) => [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.smartComputerSuspendState,
          actionType: EntityActions.suspend,
        ),
      ];

  /// Else preset

  static List<RequestActionObject> customDelay(
    String entityId,
    Duration delay,
  ) =>
      [
        RequestActionObject(
          entityIds: HashSet.from([entityId]),
          property: EntityProperties.delay,
          actionType: EntityActions.useValue,
          value: HashMap.from({ActionValues.duration: delay}),
        ),
      ];
}
