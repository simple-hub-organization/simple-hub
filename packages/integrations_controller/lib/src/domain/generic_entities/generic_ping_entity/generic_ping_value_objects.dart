import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_ping_entity/generic_ping_validators.dart';
import 'package:dartz/dartz.dart';

class GenericPingSwitchState extends ValueObjectCore<String> {
  factory GenericPingSwitchState(String? input) {
    assert(input != null);
    return GenericPingSwitchState._(
      validateGenericPingStateNotEmpty(input!),
    );
  }

  const GenericPingSwitchState._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;

  /// All valid actions of ping state
  static List<String> pingValidActions() {
    return pingAllValidActions();
  }
}
