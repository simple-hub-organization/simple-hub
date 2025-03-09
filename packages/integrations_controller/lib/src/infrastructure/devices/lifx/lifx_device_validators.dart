import 'package:dartz/dartz.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';

Either<CoreFailure<String>, String> validateLifxIdNotEmpty(String input) {
  return right(input);
}

Either<CoreFailure<String>, String> validateLifxPortNotEmpty(String input) {
  return right(input);
}
