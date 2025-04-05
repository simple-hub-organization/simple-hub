import 'package:dartz/dartz.dart';
import 'package:integrations_controller/src/domain/generic_entities/entity_type_utils.dart';
import 'package:integrations_controller/src/domain/routine/routine_cbj_failures.dart';

Either<RoutineCbjFailure<String>, String> validateRoutineNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      RoutineCbjFailure.empty(
        failedValue: input,
      ),
    );
  }
}

Either<RoutineCbjFailure<String>, String> validateRoutineMaxNameLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      RoutineCbjFailure.exceedingLength(
        failedValue: input,
        max: maxLength,
      ),
    );
  }
}

Either<RoutineCbjFailure<String>, String>
    validateRoutineCbjBackgroundColorNotEmpty(
  String input,
) {
  return right(input);
}

Either<RoutineCbjFailure<String>, String?>
    validateRoutineCbjAutomationStringLugit(
  String? input,
) {
  return right(input);
}

Either<RoutineCbjFailure<String>, String?> validateRoutineCbjNodeRedFlowId(
  String? input,
) {
  return right(input);
}

Either<RoutineCbjFailure<String>, String?> validateRoutineCbjFirstNodeId(
  String? input,
) {
  return right(input);
}

Either<RoutineCbjFailure<String>, String?> validateRoutineCbjIconCodePoint(
  String? input,
) {
  return right(input);
}

Either<RoutineCbjFailure<String>, String?> validateRoutineCbjBackgroundImage(
  String? input,
) {
  return right(input);
}

Either<RoutineCbjFailure<String>, String?> validateRoutineCbjLastDateOfExecute(
  String? input,
) {
  return right(input);
}

Either<RoutineCbjFailure<String>, String?> validateRoutineCbjStateMassage(
  String? input,
) {
  return right(input);
}

Either<RoutineCbjFailure<String>, String?> validateRoutineCbjSenderDeviceOs(
  String? input,
) {
  return right(input);
}

Either<RoutineCbjFailure<String>, String?> validateRoutineCbjSenderDeviceModel(
  String? input,
) {
  return right(input);
}

Either<RoutineCbjFailure<String>, String?> validateRoutineCbjSenderId(
  String? input,
) {
  return right(input);
}

Either<RoutineCbjFailure<String>, String?> validateRoutineCbjCompUuid(
  String? input,
) {
  return right(input);
}

Either<RoutineCbjFailure<String>, String> validateRoutineCbjDeviceStateGRPC(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      RoutineCbjFailure.empty(
        failedValue: input,
      ),
    );
  }
}

Either<RoutineCbjFailure<String>, String> validateRoutineStateExist(
  String input,
) {
  if (EntityUtils.stringToDeviceState(input) != null) {
    return right(input);
  }
  return left(const RoutineCbjFailure.routineStateDoesNotExist());
}

Either<RoutineCbjFailure<String>, String> validateRoutineCbjTypeExist(
  String input,
) {
  // TODO: Should check if exist in WhenToExecute
  return right(input);
}

Either<RoutineCbjFailure<List<String>>, List<String>>
    validateRoutineCbjDateDaysValid(
  List<String> input,
) {
  final List<String> inputMutable = List.from(input);
  for (int index = 0; index < input.length; index++) {
    final String day = input[index].toLowerCase();

    if (day == 'sunday' || day == 'sun' || day == 'su') {
      inputMutable[index] = 'sunday';
    } else if (day == 'monday' || day == 'mon' || day == 'mo') {
      inputMutable[index] = 'monday';
    } else if (day == 'tuesday' || day == 'tue' || day == 'tu') {
      inputMutable[index] = 'tuesday';
    } else if (day == 'wednesday' || day == 'wed' || day == 'we') {
      inputMutable[index] = 'wednesday';
    } else if (day == 'thursday' || day == 'thu' || day == 'th') {
      inputMutable[index] = 'thursday';
    } else if (day == 'friday' || day == 'fri' || day == 'fr') {
      inputMutable[index] = 'friday';
    } else if (day == 'saturday' || day == 'sat' || day == 'sa') {
      inputMutable[index] = 'saturday';
    } else {
      return left(const RoutineCbjFailure.unexpected());
    }
  }
  return right(inputMutable);
}

Either<RoutineCbjFailure<String>, String> validateRoutineCbjRepeatDateHourValid(
  String input,
) {
  // TODO: Check if this is valid hour
  return right(input);
}

Either<RoutineCbjFailure<String>, String> validateRoutineRepeatDateMinuteValid(
  String input,
) {
  // TODO: Check if this is valid minute
  return right(input);
}
