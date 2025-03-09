import 'package:dartz/dartz.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';

Either<CoreFailure<String>, String> validateGenericRgbwLightStateNotEmpty(
  String input,
) {
  return right(input);
}

Either<CoreFailure<String>, String> validateGenericRgbwLightStringNotEmpty(
  String input,
) {
  return right(input);
}

Either<CoreFailure<String>, String>
    validateGenericRgbwLightColorTemperatureNotEmpty(String input) {
  return right(input);
}

Either<CoreFailure<String>, String> validateGenericRgbwLightBrightnessNotEmpty(
  String input,
) {
  return right(input);
}

Either<CoreFailure<String>, String> validateGenericRgbwLightAlphaNotEmpty(
  String input,
) {
  return right(input);
}

Either<CoreFailure<String>, String> validateGenericRgbwLightStringIsDouble(
  String input,
) {
  if (double.tryParse(input) != null) {
    return right(input);
  } else {
    return left(CoreFailure.empty(failedValue: input));
  }
}

/// Return all the valid actions for rgbw light
List<String> rgbwLightAllValidActions() {
  return [
    EntityActions.off.toString(),
    EntityActions.on.toString(),
  ];
}
