import 'package:dartz/dartz.dart';
import 'package:integrations_controller/src/domain/hub/hub_failures.dart';

Either<HubFailures<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      HubFailures.empty(
        failedValue: input,
      ),
    );
  }
}
