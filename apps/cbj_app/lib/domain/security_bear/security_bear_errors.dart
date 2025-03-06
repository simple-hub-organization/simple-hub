import 'package:cybearjinni/domain/security_bear/security_bear_failures.dart';

class SecurityBearUnexpectedValueError extends Error {
  SecurityBearUnexpectedValueError(this.homeUserValueFailure);

  final SecurityBearFailures homeUserValueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString(
      '$explanation Failure was: $homeUserValueFailure',
    );
  }
}
