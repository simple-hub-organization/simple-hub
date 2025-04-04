import 'package:dartz/dartz.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';

Either<CoreFailure<String>, String> validateTasmotaIpHostNameNotEmpty(
  String input,
) {
  return right(input);
}

Either<CoreFailure<String>, String> validateTasmotaIpLastIpNotEmpty(
  String input,
) {
  return right(input);
}

Either<CoreFailure<String>, String> validateTasmotaIpDeviceIdNotEmpty(
  String input,
) {
  return right(input);
}
