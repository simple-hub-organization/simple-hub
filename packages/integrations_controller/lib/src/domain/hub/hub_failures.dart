import 'package:freezed_annotation/freezed_annotation.dart';

part 'hub_failures.freezed.dart';

@freezed
class HubFailures<T> {
  const factory HubFailures.empty({
    required T failedValue,
  }) = _Empty;

  const factory HubFailures.unexpected() = _Unexpected;

  const factory HubFailures.validateEmailNotEmpty() = _ValidateEmailNotEmpty;

  const factory HubFailures.insufficientPermission() = _InsufficientPermission;

  const factory HubFailures.wifiIsClosed() = _WifiIsClosed;

  const factory HubFailures.findingHubWhenConnectedToEthernetCableIsNotSupported() =
      _FindingHubWhenConnectedToEthernetCableIsNotSupported;

  const factory HubFailures.unableToUpdate() = _UnableToUpdate;

  const factory HubFailures.cantFindHubInNetwork() = _CantFindHubInNetwork;

  const factory HubFailures.hubFoundButNotRunning() = _HubFoundButNotRunning;

  const factory HubFailures.automaticHubSearchNotSupportedOnWeb() =
      _AutomaticHubSearchNotSupportedOnWeb;
}
