import 'package:cybearjinni/domain/home_user/home_user_failures.dart';

class HomeUserUnexpectedValueError extends Error {
  HomeUserUnexpectedValueError(this.homeUserValueFailure);

  final HomeUserFailures homeUserValueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString(
      '$explanation Failure was: $homeUserValueFailure',
    );
  }
}
