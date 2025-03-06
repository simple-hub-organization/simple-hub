import 'package:cbj_integrations_controller/src/domain/area/area_failures.dart';

class AreaUnexpectedValueError extends Error {
  AreaUnexpectedValueError(this.areasValueFailure);

  final AreaFailure areasValueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $areasValueFailure');
  }
}
