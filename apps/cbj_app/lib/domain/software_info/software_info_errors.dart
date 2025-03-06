import 'package:cybearjinni/domain/software_info/software_info_failures.dart';

class SoftwareInfoUnexpectedValueError extends Error {
  SoftwareInfoUnexpectedValueError(this.homeUserValueFailure);

  final SoftwareInfoFailures homeUserValueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString(
      '$explanation Failure was: $homeUserValueFailure',
    );
  }
}
