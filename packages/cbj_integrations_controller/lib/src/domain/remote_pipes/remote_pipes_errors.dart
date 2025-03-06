import 'package:cbj_integrations_controller/src/domain/remote_pipes/remote_pipes_failures.dart';

class RemotePipesUnexpectedValueError extends Error {
  RemotePipesUnexpectedValueError(this.homeUserValueFailure);

  final RemotePipesFailures homeUserValueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString(
      '$explanation Failure was: $homeUserValueFailure',
    );
  }
}
