import 'package:dartz/dartz.dart';
import 'package:simple_hub/domain/security_bear/security_bear_failures.dart';

Either<SecurityBearFailures<String>, String> validateStringNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      SecurityBearFailures.empty(
        failedValue: input,
      ),
    );
  }
}
