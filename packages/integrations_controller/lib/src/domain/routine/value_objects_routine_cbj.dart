import 'package:integrations_controller/src/domain/routine/routine_cbj_errors.dart';
import 'package:integrations_controller/src/domain/routine/routine_cbj_failures.dart';
import 'package:integrations_controller/src/domain/routine/routine_cbj_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObjectRoutinesCbj<T> {
  const ValueObjectRoutinesCbj();

  Either<RoutineCbjFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [AuthValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw RoutineCbjUnexpectedValueError(f), id);
  }

  Either<RoutineCbjFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';

  @override
  @nonVirtual
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObjectRoutinesCbj<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class RoutineUniqueId extends ValueObjectRoutinesCbj<String> {
  factory RoutineUniqueId() {
    return RoutineUniqueId._(right(const Uuid().v1()));
  }

  factory RoutineUniqueId.fromUniqueString(String uniqueId) {
    return RoutineUniqueId._(right(uniqueId));
  }

  factory RoutineUniqueId.discoveredRoutineId() {
    return RoutineUniqueId._(right('00000000-0000-0000-0000-000000000000'));
  }

  const RoutineUniqueId._(this.value);

  @override
  final Either<RoutineCbjFailure<String>, String> value;
}

class RoutineCbjName extends ValueObjectRoutinesCbj<String> {
  factory RoutineCbjName(String input) {
    return RoutineCbjName._(
      validateRoutineNotEmpty(input)
          .flatMap((a) => validateRoutineMaxNameLength(input, maxLength)),
    );
  }

  factory RoutineCbjName.discoveredRoutineName() {
    return RoutineCbjName._(right('Discovered'));
  }

  const RoutineCbjName._(this.value);

  @override
  final Either<RoutineCbjFailure<String>, String> value;

  static const maxLength = 1000;
}

class RoutineCbjBackgroundColor extends ValueObjectRoutinesCbj<String> {
  factory RoutineCbjBackgroundColor(String input) {
    return RoutineCbjBackgroundColor._(
      validateRoutineCbjBackgroundColorNotEmpty(input),
    );
  }

  const RoutineCbjBackgroundColor._(this.value);

  @override
  final Either<RoutineCbjFailure<String>, String> value;
}

class RoutineCbjAutomationString extends ValueObjectRoutinesCbj<String?> {
  factory RoutineCbjAutomationString(String? input) {
    return RoutineCbjAutomationString._(
      validateRoutineCbjAutomationStringLugit(input),
    );
  }

  const RoutineCbjAutomationString._(this.value);

  @override
  final Either<RoutineCbjFailure<String?>, String?> value;
}

class RoutineCbjNodeRedFlowId extends ValueObjectRoutinesCbj<String?> {
  factory RoutineCbjNodeRedFlowId(String? input) {
    return RoutineCbjNodeRedFlowId._(validateRoutineCbjNodeRedFlowId(input));
  }

  const RoutineCbjNodeRedFlowId._(this.value);

  @override
  final Either<RoutineCbjFailure<String?>, String?> value;
}

class RoutineCbjFirstNodeId extends ValueObjectRoutinesCbj<String?> {
  factory RoutineCbjFirstNodeId(String? input) {
    return RoutineCbjFirstNodeId._(validateRoutineCbjFirstNodeId(input));
  }

  const RoutineCbjFirstNodeId._(this.value);

  @override
  final Either<RoutineCbjFailure<String?>, String?> value;
}

class RoutineCbjIconCodePoint extends ValueObjectRoutinesCbj<String?> {
  factory RoutineCbjIconCodePoint(String? input) {
    return RoutineCbjIconCodePoint._(validateRoutineCbjIconCodePoint(input));
  }

  const RoutineCbjIconCodePoint._(this.value);

  @override
  final Either<RoutineCbjFailure<String?>, String?> value;
}

class RoutineCbjBackgroundImage extends ValueObjectRoutinesCbj<String?> {
  factory RoutineCbjBackgroundImage(String? input) {
    return RoutineCbjBackgroundImage._(validateRoutineCbjIconCodePoint(input));
  }

  const RoutineCbjBackgroundImage._(this.value);

  @override
  final Either<RoutineCbjFailure<String?>, String?> value;
}

class RoutineCbjLastDateOfExecute extends ValueObjectRoutinesCbj<String?> {
  factory RoutineCbjLastDateOfExecute(String? input) {
    return RoutineCbjLastDateOfExecute._(
      validateRoutineCbjIconCodePoint(input),
    );
  }

  const RoutineCbjLastDateOfExecute._(this.value);

  @override
  final Either<RoutineCbjFailure<String?>, String?> value;
}

class RoutineCbjStateMassage extends ValueObjectRoutinesCbj<String?> {
  factory RoutineCbjStateMassage(String? input) {
    return RoutineCbjStateMassage._(validateRoutineCbjStateMassage(input));
  }

  const RoutineCbjStateMassage._(this.value);

  @override
  final Either<RoutineCbjFailure<String?>, String?> value;
}

class RoutineCbjSenderDeviceOs extends ValueObjectRoutinesCbj<String?> {
  factory RoutineCbjSenderDeviceOs(String? input) {
    return RoutineCbjSenderDeviceOs._(validateRoutineCbjSenderDeviceOs(input));
  }

  const RoutineCbjSenderDeviceOs._(this.value);

  @override
  final Either<RoutineCbjFailure<String?>, String?> value;
}

class RoutineCbjSenderDeviceModel extends ValueObjectRoutinesCbj<String?> {
  factory RoutineCbjSenderDeviceModel(String? input) {
    return RoutineCbjSenderDeviceModel._(
      validateRoutineCbjSenderDeviceModel(input),
    );
  }

  const RoutineCbjSenderDeviceModel._(this.value);

  @override
  final Either<RoutineCbjFailure<String?>, String?> value;
}

class RoutineCbjSenderId extends ValueObjectRoutinesCbj<String?> {
  factory RoutineCbjSenderId(String? input) {
    return RoutineCbjSenderId._(validateRoutineCbjSenderId(input));
  }

  const RoutineCbjSenderId._(this.value);

  @override
  final Either<RoutineCbjFailure<String?>, String?> value;
}

class RoutineCbjCompUuid extends ValueObjectRoutinesCbj<String?> {
  factory RoutineCbjCompUuid(String? input) {
    return RoutineCbjCompUuid._(validateRoutineCbjCompUuid(input));
  }

  const RoutineCbjCompUuid._(this.value);

  @override
  final Either<RoutineCbjFailure<String?>, String?> value;
}

class RoutineCbjDeviceStateGRPC extends ValueObjectRoutinesCbj<String?> {
  factory RoutineCbjDeviceStateGRPC(String? input) {
    return RoutineCbjDeviceStateGRPC._(
      validateRoutineCbjDeviceStateGRPC(input!)
          .flatMap((a) => validateRoutineStateExist(input)),
    );
  }

  const RoutineCbjDeviceStateGRPC._(this.value);

  @override
  final Either<RoutineCbjFailure<String?>, String?> value;
}

class RoutineCbjRepeatType extends ValueObjectRoutinesCbj<String?> {
  factory RoutineCbjRepeatType(String? input) {
    return RoutineCbjRepeatType._(
      validateRoutineCbjTypeExist(input!),
    );
  }

  const RoutineCbjRepeatType._(this.value);

  @override
  final Either<RoutineCbjFailure<String?>, String?> value;
}

class RoutineCbjRepeatDateDays extends ValueObjectRoutinesCbj<List<String>?> {
  factory RoutineCbjRepeatDateDays(List<String>? input) {
    return RoutineCbjRepeatDateDays._(
      validateRoutineCbjDateDaysValid(input!),
    );
  }

  const RoutineCbjRepeatDateDays._(this.value);

  @override
  final Either<RoutineCbjFailure<List<String>?>, List<String>?> value;
}

class RoutineCbjRepeatDateHour extends ValueObjectRoutinesCbj<String?> {
  factory RoutineCbjRepeatDateHour(String? input) {
    return RoutineCbjRepeatDateHour._(
      validateRoutineCbjRepeatDateHourValid(input!),
    );
  }

  const RoutineCbjRepeatDateHour._(this.value);

  @override
  final Either<RoutineCbjFailure<String?>, String?> value;
}

class RoutineCbjRepeatDateMinute extends ValueObjectRoutinesCbj<String?> {
  factory RoutineCbjRepeatDateMinute(String? input) {
    return RoutineCbjRepeatDateMinute._(
      validateRoutineRepeatDateMinuteValid(input!),
    );
  }

  const RoutineCbjRepeatDateMinute._(this.value);

  @override
  final Either<RoutineCbjFailure<String?>, String?> value;
}
