import 'package:freezed_annotation/freezed_annotation.dart';

part 'routine_cbj_failures.freezed.dart';

@freezed
class RoutineCbjFailure<T> {
  const factory RoutineCbjFailure.unexpected() = _Unexpected;

  const factory RoutineCbjFailure.insufficientPermission() =
      _InsufficientPermission;

  const factory RoutineCbjFailure.unableToUpdate() = _UnableToUpdate;

  const factory RoutineCbjFailure.empty({
    required T failedValue,
  }) = _Empty;

  const factory RoutineCbjFailure.actionExcecuter({
    required T failedValue,
  }) = _ActionExcecuter;

  const factory RoutineCbjFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = _ExceedingLength;

  const factory RoutineCbjFailure.powerConsumptionIsNotNumber() =
      _PowerConsumptionIsNotNumber;

  const factory RoutineCbjFailure.areasActionDoesNotExist() =
      _AreasActionDoesNotExist;

  const factory RoutineCbjFailure.areasTypeDoesNotExist() =
      _AreasTypeDoesNotExist;

  const factory RoutineCbjFailure.routineStateDoesNotExist() =
      _RoutineStateDoesNotExist;
}
