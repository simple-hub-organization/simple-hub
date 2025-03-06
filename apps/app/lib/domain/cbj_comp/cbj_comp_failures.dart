import 'package:freezed_annotation/freezed_annotation.dart';

part 'cbj_comp_failures.freezed.dart';

@freezed
class CbjCompFailure<T> {
  const factory CbjCompFailure.empty({
    required T failedValue,
  }) = _Empty;

  const factory CbjCompFailure.actionExcecuter({
    required T failedValue,
  }) = _ActionExcecuter;

  const factory CbjCompFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = _ExceedingLength;

  const factory CbjCompFailure.unexpected() = _Unexpected;

  const factory CbjCompFailure.insufficientPermission() =
      _InsufficientPermission;

  const factory CbjCompFailure.unableToUpdate() = _UnableToUpdate;
}
