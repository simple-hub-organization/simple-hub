import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';

class CoreUnexpectedValueError extends Error {
  CoreUnexpectedValueError(this.deviceValueFailure);

  final CoreFailure deviceValueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $deviceValueFailure');
  }
}
