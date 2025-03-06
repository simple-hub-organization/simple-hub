import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_blinds_entity/generic_blinds_validators.dart';
import 'package:dartz/dartz.dart';

class GenericBlindsSwitchState extends ValueObjectCore<String> {
  factory GenericBlindsSwitchState(String? input) {
    assert(input != null);
    return GenericBlindsSwitchState._(
      validateGenericBlindsStateNotEmpty(input!),
    );
  }

  const GenericBlindsSwitchState._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;

  static List<String> blindsValidActions() {
    return blindsAllValidActions();
  }
}
