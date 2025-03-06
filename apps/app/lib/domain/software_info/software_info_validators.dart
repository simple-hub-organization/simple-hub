import 'package:dartz/dartz.dart';
import 'package:simple_hub/domain/software_info/software_info_failures.dart';

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
