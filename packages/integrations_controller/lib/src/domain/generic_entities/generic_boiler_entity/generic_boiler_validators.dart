import 'package:dartz/dartz.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';

Either<CoreFailure<String>, String> validateGenericBoilerStateNotEmpty(
  String input,
) {
  return right(input);
}

/// Return all the valid actions for blinds
List<String> boilerAllValidActions() {
  return [
    EntityActions.off.toString(),
    EntityActions.on.toString(),
  ];
}
