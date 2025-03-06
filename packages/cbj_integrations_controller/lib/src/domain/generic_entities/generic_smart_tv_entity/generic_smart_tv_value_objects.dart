import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_smart_tv_entity/generic_smart_tv_validators.dart';
import 'package:dartz/dartz.dart';

class GenericSmartTvSwitchState extends ValueObjectCore<String> {
  factory GenericSmartTvSwitchState(String? input) {
    assert(input != null);
    return GenericSmartTvSwitchState._(
      validateGenericSmartTvStateNotEmpty(input!),
    );
  }

  const GenericSmartTvSwitchState._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;

  /// All valid actions of smart tv state
  static List<String> smartTvValidActions() {
    return smartTvAllValidActions();
  }
}

class GenericSmartTvPausePlayState extends ValueObjectCore<String> {
  factory GenericSmartTvPausePlayState(String? input) {
    assert(input != null);
    return GenericSmartTvPausePlayState._(
      validateGenericSmartTvPausePlayStateValidation(input!),
    );
  }

  const GenericSmartTvPausePlayState._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;

  /// All valid actions of smart tv state
  static List<String> smartTvValidActions() {
    return smartTvAllValidActions();
  }
}

class GenericSmartTvVolume extends ValueObjectCore<String> {
  factory GenericSmartTvVolume(String? input) {
    assert(input != null);
    return GenericSmartTvVolume._(
      validateGenericSmartTvVolumeValidation(input!),
    );
  }

  const GenericSmartTvVolume._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;

  /// All valid actions of smart tv state
  static List<String> smartTvValidActions() {
    return smartTvAllValidActions();
  }
}
