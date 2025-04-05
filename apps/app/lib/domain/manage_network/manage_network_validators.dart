import 'package:dartz/dartz.dart';
import 'package:simple_hub/domain/manage_network/manage_network_failures.dart';

Either<ManageNetworkFailures<String>, String> validateMangageNetworkNameEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      ManageNetworkFailures.empty(
        failedValue: input,
      ),
    );
  }
}
