import 'package:cbj_integrations_controller/src/domain/remote_pipes/remote_pipes_failures.dart';
import 'package:dartz/dartz.dart';

Either<RemotePipesFailures<String>, String> validateRemotePipesEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      RemotePipesFailures.empty(
        failedValue: input,
      ),
    );
  }
}
