import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_network_failures.freezed.dart';

@freezed
class ManageNetworkFailures<T> {
  const factory ManageNetworkFailures.empty({
    required T failedValue,
  }) = _Empty;

  const factory ManageNetworkFailures.unexpected() = _Unexpected;

  const factory ManageNetworkFailures.validateEmailNotEmpty() =
      _ValidateEmailNotEmpty;

  const factory ManageNetworkFailures.insufficientPermission() =
      _InsufficientPermission;

  const factory ManageNetworkFailures.wifiIsClosed() = _wifiIsClosed;

  const factory ManageNetworkFailures.unableToUpdate() = _UnableToUpdate;
}
