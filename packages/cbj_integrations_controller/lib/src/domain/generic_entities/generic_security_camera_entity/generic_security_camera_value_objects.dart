import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_security_camera_entity/generic_security_camera_validators.dart';
import 'package:dartz/dartz.dart';

class GenericSecurityCameraSuspendState extends ValueObjectCore<String> {
  factory GenericSecurityCameraSuspendState(String? input) {
    assert(input != null);
    return GenericSecurityCameraSuspendState._(
      validateGenericSecurityCameraStateNotEmpty(input!),
    );
  }

  const GenericSecurityCameraSuspendState._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;

  static List<String> securityCameraValidActions() {
    return securityCameraAllValidActions();
  }
}
