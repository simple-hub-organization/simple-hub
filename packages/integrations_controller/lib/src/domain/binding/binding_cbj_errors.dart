import 'package:integrations_controller/src/domain/binding/binding_cbj_failures.dart';

class BindingCbjUnexpectedValueError extends Error {
  BindingCbjUnexpectedValueError(this.bindingsValueFailure);

  final BindingCbjFailure bindingsValueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString(
      '$explanation Failure was: $bindingsValueFailure',
    );
  }
}
