import 'package:security_bear/domain/local_db/local_db_failures.dart';

class LocalDbUnexpectedValueError extends Error {
  LocalDbUnexpectedValueError(this.userValueFailure);

  final LocalDbFailures userValueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $userValueFailure');
  }
}
