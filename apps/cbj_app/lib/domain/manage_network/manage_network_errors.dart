import 'package:cybearjinni/domain/manage_network/manage_network_failures.dart';

class ManageNetworkUnexpectedValueError extends Error {
  ManageNetworkUnexpectedValueError(this.homeUserValueFailure);

  final ManageNetworkFailures homeUserValueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString(
      '$explanation Failure was: $homeUserValueFailure',
    );
  }
}
