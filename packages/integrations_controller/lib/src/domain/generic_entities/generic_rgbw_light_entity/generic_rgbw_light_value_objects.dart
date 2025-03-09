import 'package:dartz/dartz.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/entity_type_utils.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_validators.dart';

class GenericLightModeState extends ValueObjectCore<String> {
  factory GenericLightModeState(ColorMode input) {
    return GenericLightModeState._(
      validateGenericRgbwLightStateNotEmpty(input.name),
      input,
    );
  }

  const GenericLightModeState._(this.value, this.mode);

  final ColorMode mode;

  @override
  final Either<CoreFailure<String>, String> value;
}

class GenericRgbwLightSwitchState extends ValueObjectCore<String> {
  factory GenericRgbwLightSwitchState(String? input) {
    assert(input != null);
    EntityActions action;
    if (input!.toLowerCase() == true.toString()) {
      action = EntityActions.on;
    } else if (input.toLowerCase() == false.toString()) {
      action = EntityActions.off;
    } else {
      action =
          EntityUtils.stringToDeviceAction(input) ?? EntityActions.undefined;
    }

    return GenericRgbwLightSwitchState._(
      validateGenericRgbwLightStateNotEmpty(action.name),
      action,
    );
  }

  const GenericRgbwLightSwitchState._(this.value, this._action);

  final EntityActions _action;

  EntityActions get action => _action;

  @override
  final Either<CoreFailure<String>, String> value;

  /// All valid actions of rgb light state
  static List<String> rgbwLightValidActions() {
    return rgbwLightAllValidActions();
  }
}

class GenericRgbwLightColorTemperature extends ValueObjectCore<String> {
  factory GenericRgbwLightColorTemperature(String? input) {
    assert(input != null);
    return GenericRgbwLightColorTemperature._(
      validateGenericRgbwLightStateNotEmpty(input!),
    );
  }

  const GenericRgbwLightColorTemperature._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

/// Alpha, from 0.0 to 1.0. The describes the transparency of the color.
/// A value of 0.0 is fully transparent, and 1.0 is fully opaque.
class GenericRgbwLightColorAlpha extends ValueObjectCore<String> {
  factory GenericRgbwLightColorAlpha(String? input) {
    assert(input != null);
    return GenericRgbwLightColorAlpha._(
      validateGenericRgbwLightAlphaNotEmpty(input!)
          .flatMap((a) => validateGenericRgbwLightStringIsDouble(a)),
    );
  }

  const GenericRgbwLightColorAlpha._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

/// Hue, from 0.0 to 360.0. Describes which color of the spectrum is
/// represented. A value of 0.0 represents red, as does 360.0. Values in
/// between go through all the hues representable in RGB. You can think of
/// this as selecting which pigment will be added to a color.
class GenericRgbwLightColorHue extends ValueObjectCore<String> {
  factory GenericRgbwLightColorHue(String? input) {
    assert(input != null);
    return GenericRgbwLightColorHue._(
      validateGenericRgbwLightStringNotEmpty(input!)
          .flatMap((a) => validateGenericRgbwLightStringIsDouble(a)),
    );
  }

  const GenericRgbwLightColorHue._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

/// Saturation, from 0.0 to 1.0. This describes how colorful the color is.
/// 0.0 implies a shade of grey (i.e. no pigment), and 1.0 implies a color as
/// vibrant as that hue gets. You can think of this as the equivalent of
/// how much of a pigment is added.
class GenericRgbwLightColorSaturation extends ValueObjectCore<String> {
  factory GenericRgbwLightColorSaturation(String? input) {
    assert(input != null);
    return GenericRgbwLightColorSaturation._(
      validateGenericRgbwLightStringNotEmpty(input!)
          .flatMap((a) => validateGenericRgbwLightStringIsDouble(a)),
    );
  }

  const GenericRgbwLightColorSaturation._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

/// Value, from 0.0 to 1.0. The "value" of a color that, in this context,
/// describes how bright a color is. A value of 0.0 indicates black, and 1.0
/// indicates full intensity color. You can think of this as the equivalent of
/// removing black from the color as value increases.
class GenericRgbwLightColorValue extends ValueObjectCore<String> {
  factory GenericRgbwLightColorValue(String? input) {
    assert(input != null);
    return GenericRgbwLightColorValue._(
      validateGenericRgbwLightStringNotEmpty(input!)
          .flatMap((a) => validateGenericRgbwLightStringIsDouble(a)),
    );
  }

  const GenericRgbwLightColorValue._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}

class GenericRgbwLightBrightness extends ValueObjectCore<String> {
  factory GenericRgbwLightBrightness(String? input) {
    assert(input != null);
    return GenericRgbwLightBrightness._(
      validateGenericRgbwLightBrightnessNotEmpty(input!),
    );
  }

  const GenericRgbwLightBrightness._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}
