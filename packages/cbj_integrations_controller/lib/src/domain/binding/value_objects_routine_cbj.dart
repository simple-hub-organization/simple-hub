import 'package:cbj_integrations_controller/src/domain/binding/binding_cbj_errors.dart';
import 'package:cbj_integrations_controller/src/domain/binding/binding_cbj_failures.dart';
import 'package:cbj_integrations_controller/src/domain/binding/binding_cbj_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObjectBindingsCbj<T> {
  const ValueObjectBindingsCbj();

  Either<BindingCbjFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [AuthValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw BindingCbjUnexpectedValueError(f), id);
  }

  Either<BindingCbjFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';

  @override
  @nonVirtual
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObjectBindingsCbj<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class BindingUniqueId extends ValueObjectBindingsCbj<String> {
  factory BindingUniqueId() {
    return BindingUniqueId._(right(const Uuid().v1()));
  }

  factory BindingUniqueId.fromUniqueString(String uniqueId) {
    return BindingUniqueId._(right(uniqueId));
  }

  factory BindingUniqueId.discoveredBindingId() {
    return BindingUniqueId._(right('00000000-0000-0000-0000-000000000000'));
  }

  const BindingUniqueId._(this.value);

  @override
  final Either<BindingCbjFailure<String>, String> value;
}

class BindingCbjName extends ValueObjectBindingsCbj<String> {
  factory BindingCbjName(String input) {
    return BindingCbjName._(
      validateBindingNotEmpty(input)
          .flatMap((a) => validateBindingMaxNameLength(input, maxLength)),
    );
  }

  factory BindingCbjName.discoveredBindingName() {
    return BindingCbjName._(right('Discovered'));
  }

  const BindingCbjName._(this.value);

  @override
  final Either<BindingCbjFailure<String>, String> value;

  static const maxLength = 1000;
}

class BindingCbjBackgroundColor extends ValueObjectBindingsCbj<String> {
  factory BindingCbjBackgroundColor(String input) {
    return BindingCbjBackgroundColor._(
      validateBindingCbjBackgroundColorNotEmpty(input),
    );
  }

  const BindingCbjBackgroundColor._(this.value);

  @override
  final Either<BindingCbjFailure<String>, String> value;
}

class BindingCbjAutomationString extends ValueObjectBindingsCbj<String?> {
  factory BindingCbjAutomationString(String? input) {
    return BindingCbjAutomationString._(
      validateBindingCbjAutomationStringLugit(input),
    );
  }

  const BindingCbjAutomationString._(this.value);

  @override
  final Either<BindingCbjFailure<String?>, String?> value;
}

class BindingCbjNodeRedFlowId extends ValueObjectBindingsCbj<String?> {
  factory BindingCbjNodeRedFlowId(String? input) {
    return BindingCbjNodeRedFlowId._(validateBindingCbjNodeRedFlowId(input));
  }

  const BindingCbjNodeRedFlowId._(this.value);

  @override
  final Either<BindingCbjFailure<String?>, String?> value;
}

class BindingCbjFirstNodeId extends ValueObjectBindingsCbj<String?> {
  factory BindingCbjFirstNodeId(String? input) {
    return BindingCbjFirstNodeId._(validateBindingCbjFirstNodeId(input));
  }

  const BindingCbjFirstNodeId._(this.value);

  @override
  final Either<BindingCbjFailure<String?>, String?> value;
}

class BindingCbjIconCodePoint extends ValueObjectBindingsCbj<String?> {
  factory BindingCbjIconCodePoint(String? input) {
    return BindingCbjIconCodePoint._(validateBindingCbjIconCodePoint(input));
  }

  const BindingCbjIconCodePoint._(this.value);

  @override
  final Either<BindingCbjFailure<String?>, String?> value;
}

class BindingCbjBackgroundImage extends ValueObjectBindingsCbj<String?> {
  factory BindingCbjBackgroundImage(String? input) {
    return BindingCbjBackgroundImage._(validateBindingCbjIconCodePoint(input));
  }

  const BindingCbjBackgroundImage._(this.value);

  @override
  final Either<BindingCbjFailure<String?>, String?> value;
}

class BindingCbjLastDateOfExecute extends ValueObjectBindingsCbj<String?> {
  factory BindingCbjLastDateOfExecute(String? input) {
    return BindingCbjLastDateOfExecute._(
      validateBindingCbjIconCodePoint(input),
    );
  }

  const BindingCbjLastDateOfExecute._(this.value);

  @override
  final Either<BindingCbjFailure<String?>, String?> value;
}

class BindingCbjStateMassage extends ValueObjectBindingsCbj<String?> {
  factory BindingCbjStateMassage(String? input) {
    return BindingCbjStateMassage._(validateBindingCbjStateMassage(input));
  }

  const BindingCbjStateMassage._(this.value);

  @override
  final Either<BindingCbjFailure<String?>, String?> value;
}

class BindingCbjSenderDeviceOs extends ValueObjectBindingsCbj<String?> {
  factory BindingCbjSenderDeviceOs(String? input) {
    return BindingCbjSenderDeviceOs._(validateBindingCbjSenderDeviceOs(input));
  }

  const BindingCbjSenderDeviceOs._(this.value);

  @override
  final Either<BindingCbjFailure<String?>, String?> value;
}

class BindingCbjSenderDeviceModel extends ValueObjectBindingsCbj<String?> {
  factory BindingCbjSenderDeviceModel(String? input) {
    return BindingCbjSenderDeviceModel._(
      validateBindingCbjSenderDeviceModel(input),
    );
  }

  const BindingCbjSenderDeviceModel._(this.value);

  @override
  final Either<BindingCbjFailure<String?>, String?> value;
}

class BindingCbjSenderId extends ValueObjectBindingsCbj<String?> {
  factory BindingCbjSenderId(String? input) {
    return BindingCbjSenderId._(validateBindingCbjSenderId(input));
  }

  const BindingCbjSenderId._(this.value);

  @override
  final Either<BindingCbjFailure<String?>, String?> value;
}

class BindingCbjCompUuid extends ValueObjectBindingsCbj<String?> {
  factory BindingCbjCompUuid(String? input) {
    return BindingCbjCompUuid._(validateBindingCbjCompUuid(input));
  }

  const BindingCbjCompUuid._(this.value);

  @override
  final Either<BindingCbjFailure<String?>, String?> value;
}

class BindingCbjDeviceStateGRPC extends ValueObjectBindingsCbj<String?> {
  factory BindingCbjDeviceStateGRPC(String? input) {
    return BindingCbjDeviceStateGRPC._(
      validateBindingCbjDeviceStateGRPC(input!)
          .flatMap((a) => validateBindingStateExist(input)),
    );
  }

  const BindingCbjDeviceStateGRPC._(this.value);

  @override
  final Either<BindingCbjFailure<String?>, String?> value;
}
