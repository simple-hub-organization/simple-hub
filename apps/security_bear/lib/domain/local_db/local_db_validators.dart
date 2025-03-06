import 'package:dartz/dartz.dart';
import 'package:security_bear/domain/local_db/local_db_failures.dart';

Either<LocalDbFailures<String>, String> validateLocalDbEmailNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      LocalDbFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<LocalDbFailures<String>, String> validateLocalDbNameNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      LocalDbFailures.empty(
        failedValue: input,
      ),
    );
  }
}
