import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:dartz/dartz.dart';

Either<CoreFailure<String>, String> validateGenericSecurityCameraStateNotEmpty(
  String input,
) {
  return right(input);
}

/// Return all the valid actions for blinds
List<String> securityCameraAllValidActions() {
  return [
    EntityActions.suspend.toString(),
    EntityActions.shutdown.toString(),
    EntityActions.itIsFalse.toString(),
  ];
}
