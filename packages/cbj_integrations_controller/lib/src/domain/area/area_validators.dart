import 'package:cbj_integrations_controller/src/domain/area/area_failures.dart';
import 'package:dartz/dartz.dart';

Either<AreaFailure<String>, String> validateAreaNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      AreaFailure.empty(
        failedValue: input,
      ),
    );
  }
}

Either<AreaFailure<String>, String> validateAreaBackgroundNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      AreaFailure.empty(
        failedValue: input,
      ),
    );
  }
}

Either<AreaFailure<String>, String> validateAreaMaxNameLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      AreaFailure.exceedingLength(
        failedValue: input,
        max: maxLength,
      ),
    );
  }
}

Either<AreaFailure<Set<String>>, Set<String>> validateUserIdsValid(
  Set<String> input,
) {
  return right(input);
}
