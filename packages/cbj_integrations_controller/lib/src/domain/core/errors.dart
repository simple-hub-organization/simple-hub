import 'package:cbj_integrations_controller/src/domain/core/failures.dart';

class NotAuthenticatedError extends Error {}

class MissingCurrentHomeError extends Error {}

class UnexpectedValueError extends Error {
  UnexpectedValueError(this.authValueFailure);

  final AuthValueFailure authValueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $authValueFailure');
  }
}
