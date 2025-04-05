import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_bear_failures.freezed.dart';

@freezed
class SecurityBearFailures<T> {
  const factory SecurityBearFailures.empty({
    required T failedValue,
  }) = _Empty;

  const factory SecurityBearFailures.unexpected() = _Unexpected;

  const factory SecurityBearFailures.validateEmailNotEmpty() =
      _ValidateEmailNotEmpty;

  const factory SecurityBearFailures.insufficientPermission() =
      _InsufficientPermission;

  const factory SecurityBearFailures.wifiIsClosed() = _wifiIsClosed;

  const factory SecurityBearFailures.unableToUpdate() = _UnableToUpdate;

  const factory SecurityBearFailures.cantFindSecurityBearInNetwork() =
      _CantFindSecurityBearInNetwork;

  const factory SecurityBearFailures.automaticSecurityBearSearchNotSupportedOnWeb() =
      _AutomaticSecurityBearSearchNotSupportedOnWeb;
}
