import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:integrations_controller/src/domain/generic_entities/entity_type_utils.dart';
import 'package:dartz/dartz.dart';

Either<CoreFailure<String>, String> validateLastKnownIpNotEmpty(String input) {
  // if (input.isNotEmpty) {
  return right(input);
  // } else {
  //   return left(
  //     CoreFailure.empty(
  //       failedValue: input,
  //     ),
  //   );
  // }
}

Either<CoreFailure<String>, String> validatePowerConsumptionNotEmpty(
  String input,
) {
  if (double.tryParse(input) != null) {
    return right(input);
  } else {
    return left(const CoreFailure.powerConsumptionIsNotNumber());
  }
}

Either<CoreFailure<String>, String> validateAreaNameNotEmpty(String input) {
  return right(input);
}

Either<CoreFailure<String>, String> validateMdnsNameNotEmpty(String input) {
  return right(input);
}

Either<CoreFailure<String>, String> validateWiFiNameNotEmpty(String input) {
  return right(input);
}

Either<CoreFailure<String?>, String?> validatePortNotEmpty(String? input) {
  return right(input);
}

Either<CoreFailure<String>, String> validateKeyNotEmpty(String input) {
  return right(input);
}

Either<CoreFailure<String>, String> validateMaxNameLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      CoreFailure.exceedingLength(
        failedValue: input,
        max: maxLength,
      ),
    );
  }
}

Either<CoreFailure<String>, String> validateDeviceActionExist(String input) {
  if (EntityUtils.stringToDeviceAction(input) != null) {
    return right(input);
  }
  return left(const CoreFailure.deviceActionDoesNotExist());
}

Either<CoreFailure<String>, String> validateDeviceTypeExist(String input) {
  if (EntityUtils.stringToDt(input) != null) {
    return right(input);
  }
  return left(const CoreFailure.deviceTypeDoesNotExist());
}
