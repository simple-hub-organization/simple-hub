import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_smart_computer_entity/generic_smart_computer_validators.dart';
import 'package:dartz/dartz.dart';

class GenericSmartComputerSuspendState extends ValueObjectCore<String> {
  factory GenericSmartComputerSuspendState(String? input) {
    assert(input != null);
    return GenericSmartComputerSuspendState._(
      validateGenericSmartComputerStateNotEmpty(input!),
    );
  }

  const GenericSmartComputerSuspendState._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;

  static List<String> smartComputerValidActions() {
    return smartComputerAllValidActions();
  }
}

class GenericSmartComputerShutdownState extends ValueObjectCore<String> {
  factory GenericSmartComputerShutdownState(String? input) {
    assert(input != null);
    return GenericSmartComputerShutdownState._(
      validateGenericSmartComputerStateNotEmpty(input!),
    );
  }

  const GenericSmartComputerShutdownState._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;

  static List<String> smartComputerValidActions() {
    return smartComputerAllValidActions();
  }
}
