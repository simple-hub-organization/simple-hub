import 'package:freezed_annotation/freezed_annotation.dart';

part 'binding_cbj_failures.freezed.dart';

@freezed
class BindingCbjFailure<T> {
  const factory BindingCbjFailure.unexpected() = _Unexpected;

  const factory BindingCbjFailure.insufficientPermission() =
      _InsufficientPermission;

  const factory BindingCbjFailure.unableToUpdate() = _UnableToUpdate;

  const factory BindingCbjFailure.empty({
    required T failedValue,
  }) = _Empty;

  const factory BindingCbjFailure.actionExcecuter({
    required T failedValue,
  }) = _ActionExcecuter;

  const factory BindingCbjFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = _ExceedingLength;

  const factory BindingCbjFailure.powerConsumptionIsNotNumber() =
      _PowerConsumptionIsNotNumber;

  const factory BindingCbjFailure.areasActionDoesNotExist() =
      _AreasActionDoesNotExist;

  const factory BindingCbjFailure.areasTypeDoesNotExist() =
      _AreasTypeDoesNotExist;

  const factory BindingCbjFailure.bindingStateDoesNotExist() =
      _BindingStateDoesNotExist;
}
