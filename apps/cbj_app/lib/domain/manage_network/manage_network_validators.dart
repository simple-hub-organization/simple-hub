import 'package:cybearjinni/domain/manage_network/manage_network_failures.dart';
import 'package:dartz/dartz.dart';

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
