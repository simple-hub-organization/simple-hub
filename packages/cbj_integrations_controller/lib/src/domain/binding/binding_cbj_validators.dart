import 'package:cbj_integrations_controller/src/domain/binding/binding_cbj_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/entity_type_utils.dart';
import 'package:dartz/dartz.dart';

Either<BindingCbjFailure<String>, String> validateBindingNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      BindingCbjFailure.empty(
        failedValue: input,
      ),
    );
  }
}

Either<BindingCbjFailure<String>, String> validateBindingMaxNameLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      BindingCbjFailure.exceedingLength(
        failedValue: input,
        max: maxLength,
      ),
    );
  }
}

Either<BindingCbjFailure<String>, String>
    validateBindingCbjBackgroundColorNotEmpty(
  String input,
) {
  return right(input);
}

Either<BindingCbjFailure<String>, String?>
    validateBindingCbjAutomationStringLugit(
  String? input,
) {
  return right(input);
}

Either<BindingCbjFailure<String>, String?> validateBindingCbjNodeRedFlowId(
  String? input,
) {
  return right(input);
}

Either<BindingCbjFailure<String>, String?> validateBindingCbjFirstNodeId(
  String? input,
) {
  return right(input);
}

Either<BindingCbjFailure<String>, String?> validateBindingCbjIconCodePoint(
  String? input,
) {
  return right(input);
}

Either<BindingCbjFailure<String>, String?> validateBindingCbjBackgroundImage(
  String? input,
) {
  return right(input);
}

Either<BindingCbjFailure<String>, String?> validateBindingCbjLastDateOfExecute(
  String? input,
) {
  return right(input);
}

Either<BindingCbjFailure<String>, String?> validateBindingCbjStateMassage(
  String? input,
) {
  return right(input);
}

Either<BindingCbjFailure<String>, String?> validateBindingCbjSenderDeviceOs(
  String? input,
) {
  return right(input);
}

Either<BindingCbjFailure<String>, String?> validateBindingCbjSenderDeviceModel(
  String? input,
) {
  return right(input);
}

Either<BindingCbjFailure<String>, String?> validateBindingCbjSenderId(
  String? input,
) {
  return right(input);
}

Either<BindingCbjFailure<String>, String?> validateBindingCbjCompUuid(
  String? input,
) {
  return right(input);
}

Either<BindingCbjFailure<String>, String> validateBindingCbjDeviceStateGRPC(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      BindingCbjFailure.empty(
        failedValue: input,
      ),
    );
  }
}

Either<BindingCbjFailure<String>, String> validateBindingStateExist(
  String input,
) {
  if (EntityUtils.stringToDeviceState(input) != null) {
    return right(input);
  }
  return left(const BindingCbjFailure.bindingStateDoesNotExist());
}
