import 'package:cybearjinni/domain/software_info/software_info_failures.dart';
import 'package:dartz/dartz.dart';

Either<SoftwareInfoFailures<String>, String> validateSoftwareInfoEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      SoftwareInfoFailures.empty(
        failedValue: input,
      ),
    );
  }
}
