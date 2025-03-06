import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:dartz/dartz.dart';

Either<CoreFailure<String>, String> validateYeelightIdNotEmpty(String input) {
  return right(input);
}

Either<CoreFailure<String>, String> validateYeelightPortNotEmpty(String input) {
  return right(input);
}
