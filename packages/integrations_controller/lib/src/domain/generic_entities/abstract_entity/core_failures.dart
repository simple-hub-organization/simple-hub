import 'package:freezed_annotation/freezed_annotation.dart';

part 'core_failures.freezed.dart';

@freezed
class CoreFailure<T> {
  const factory CoreFailure.empty({
    required T failedValue,
  }) = _Empty;

  const factory CoreFailure.actionExcecuter({
    required T failedValue,
  }) = _ActionExcecuter;

  const factory CoreFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = _ExceedingLength;

  const factory CoreFailure.unexpected() = _Unexpected;

  const factory CoreFailure.insufficientPermission() = _InsufficientPermission;

  const factory CoreFailure.unableToUpdate() = _UnableToUpdate;

  const factory CoreFailure.powerConsumptionIsNotNumber() =
      _PowerConsumptionIsNotNumber;

  const factory CoreFailure.deviceActionDoesNotExist() =
      _DeviceActionDoesNotExist;

  const factory CoreFailure.deviceTypeDoesNotExist() = _DeviceTypeDoesNotExist;
}
