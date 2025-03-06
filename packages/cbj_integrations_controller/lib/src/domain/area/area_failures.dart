import 'package:freezed_annotation/freezed_annotation.dart';

part 'area_failures.freezed.dart';

@freezed
class AreaFailure<T> {
  const factory AreaFailure.empty({
    required T failedValue,
  }) = _Empty;

  const factory AreaFailure.actionExcecuter({
    required T failedValue,
  }) = _ActionExcecuter;

  const factory AreaFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = _ExceedingLength;

  const factory AreaFailure.unexpected() = _Unexpected;

  const factory AreaFailure.insufficientPermission() = _InsufficientPermission;

  const factory AreaFailure.unableToUpdate() = _UnableToUpdate;

  const factory AreaFailure.powerConsumptionIsNotNumber() =
      _PowerConsumptionIsNotNumber;

  const factory AreaFailure.areasActionDoesNotExist() =
      _AreasActionDoesNotExist;

  const factory AreaFailure.areasTypeDoesNotExist() = _AreasTypeDoesNotExist;
}
