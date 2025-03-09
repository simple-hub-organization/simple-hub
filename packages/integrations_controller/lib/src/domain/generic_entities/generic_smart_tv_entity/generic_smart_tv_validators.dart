import 'package:dartz/dartz.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';

Either<CoreFailure<String>, String> validateGenericSmartTvStateNotEmpty(
  String input,
) {
  return right(input);
}

Either<CoreFailure<String>, String> validateGenericSmartTvUrlValidation(
  String input,
) {
  return right(input);
}

Either<CoreFailure<String>, String>
    validateGenericSmartTvPausePlayStateValidation(
  String input,
) {
  return right(input);
}

Either<CoreFailure<String>, String>
    validateGenericSmartTvSkipBackOrForwardValidation(
  String input,
) {
  return right(input);
}

Either<CoreFailure<String>, String> validateGenericSmartTvVolumeValidation(
  String input,
) {
  return right(input);
}

/// Return all the valid actions for smart tv
List<String> smartTvAllValidActions() {
  return [
    EntityActions.off.toString(),
    EntityActions.on.toString(),
    EntityActions.pausePlay.toString(),
    EntityActions.changeVolume.toString(),
    EntityActions.skip.toString(),
  ];
}
