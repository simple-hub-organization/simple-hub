import 'package:dartz/dartz.dart';
import 'package:simple_hub/domain/home_user/home_user_failures.dart';

Either<HomeUserFailures<String?>, String?> validateHomeUserEmailNotEmpty(
  String? input,
) {
  if (input!.isNotEmpty) {
    return right(input);
  } else {
    return left(
      HomeUserFailures.empty(
        failedValue: input,
      ),
    );
  }
}

Either<HomeUserFailures<String>, String> validateHomeUserNameNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      HomeUserFailures.empty(
        failedValue: input,
      ),
    );
  }
}
