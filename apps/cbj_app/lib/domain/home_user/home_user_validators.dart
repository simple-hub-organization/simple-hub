import 'package:cybearjinni/domain/home_user/home_user_failures.dart';
import 'package:dartz/dartz.dart';

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
