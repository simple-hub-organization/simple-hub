import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:dartz/dartz.dart';

Either<CoreFailure<String>, String> validateCbjDevicesIdNotEmpty(String input) {
  return right(input);
}

Either<CoreFailure<String>, String> validateCbjDevicesPortNotEmpty(
  String input,
) {
  return right(input);
}

Either<CoreFailure<String>, String> validatedevicesMacAddressNotEmpty(
  String input,
) {
  return right(input);
}
