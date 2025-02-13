import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/domain/cbj_comp/cbj_comp_errors.dart';
import 'package:cybearjinni/domain/cbj_comp/cbj_comp_failures.dart';
import 'package:cybearjinni/domain/cbj_comp/cbj_comp_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:kt_dart/collection.dart';
// ignore: depend_on_referenced_packages
import 'package:uuid/uuid.dart';

@immutable
abstract class CbjCompValueObjectAbstract<T> {
  const CbjCompValueObjectAbstract();

  Either<CbjCompFailure<T?>, T>? get value;

  /// Throws [CbjCompUnexpectedValueError] containing the [CbjCompFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value!.fold((f) => throw CbjCompUnexpectedValueError(f), id);
  }

  /// Throws [CbjCompUnexpectedValueError] containing the [CbjCompFailure]
  T? getOrNull() {
    // id = identity - same as writing (right) => right
    return value!.fold((f) => null, id);
  }

  Either<CbjCompFailure<dynamic>, Unit> get failureOrUnit {
    return value!.fold((l) => left(l), (r) => right(unit));
  }

  bool isValid() => value!.isRight();

  @override
  String toString() => 'Value($value)';

  @override
  @nonVirtual
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is CbjCompValueObjectAbstract<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class CbjCompUniqueId extends CbjCompValueObjectAbstract<String> {
  factory CbjCompUniqueId() {
    return CbjCompUniqueId._(right(const Uuid().v1()));
  }

  const CbjCompUniqueId._(this.value);

  factory CbjCompUniqueId.fromUniqueString(String uniqueId) {
    return CbjCompUniqueId._(right(uniqueId));
  }

  @override
  final Either<CbjCompFailure<String>, String> value;
}

class CbjCompAreaId extends CbjCompValueObjectAbstract<String> {
  factory CbjCompAreaId() {
    return CbjCompAreaId._(right(const Uuid().v1()));
  }

  factory CbjCompAreaId.fromUniqueString(String uniqueId) {
    return CbjCompAreaId._(right(uniqueId));
  }

  const CbjCompAreaId._(this.value);

  @override
  final Either<CbjCompFailure<String>, String> value;
}

class CbjCompMacAddr extends CbjCompValueObjectAbstract<String> {
  factory CbjCompMacAddr(String input) {
    return CbjCompMacAddr._(
      validateCBJCompNotEmpty(input)
          .flatMap((a) => validateCBJCompMaxNameLength(input, maxLength)),
    );
  }

  const CbjCompMacAddr._(this.value);

  @override
  final Either<CbjCompFailure<String>, String> value;

  static const maxLength = 1000;
}

class CbjCompDefaultName extends CbjCompValueObjectAbstract<String> {
  factory CbjCompDefaultName(String input) {
    return CbjCompDefaultName._(
      validateCBJCompNotEmpty(input)
          .flatMap((a) => validateCBJCompMaxNameLength(input, maxLength)),
    );
  }

  const CbjCompDefaultName._(this.value);

  @override
  final Either<CbjCompFailure<String>, String> value;

  static const maxLength = 1000;
}

class CbjCompDevices
    extends CbjCompValueObjectAbstract<KtList<GenericLightDE>> {
  factory CbjCompDevices(KtList<GenericLightDE> input) {
    return CbjCompDevices._(validateCBJCompDevicesNotNull(input));
  }

  const CbjCompDevices._(this.value);

  @override
  final Either<CbjCompFailure<KtList<GenericLightDE>>, KtList<GenericLightDE>>
      value;
}

class CbjCompOs extends CbjCompValueObjectAbstract<String> {
  factory CbjCompOs(String input) {
    return CbjCompOs._(
      validateCBJCompNotEmpty(input),
    );
  }

  const CbjCompOs._(this.value);

  @override
  final Either<CbjCompFailure<String>, String> value;
}

class CbjCompModel extends CbjCompValueObjectAbstract<String> {
  factory CbjCompModel(String input) {
    return CbjCompModel._(
      validateCBJCompNotEmpty(input),
    );
  }

  const CbjCompModel._(this.value);

  @override
  final Either<CbjCompFailure<String>, String> value;
}

class CbjCompType extends CbjCompValueObjectAbstract<String> {
  factory CbjCompType(String input) {
    return CbjCompType._(
      validateCBJCompNotEmpty(input)
          .flatMap((a) => validateCBJCompTypeExist(input)),
    );
  }

  const CbjCompType._(this.value);

  @override
  final Either<CbjCompFailure<String>, String> value;
}

class CbjCompUuid extends CbjCompValueObjectAbstract<String> {
  factory CbjCompUuid(String input) {
    return CbjCompUuid._(
      validateCBJCompNotEmpty(input),
    );
  }

  const CbjCompUuid._(this.value);

  @override
  final Either<CbjCompFailure<String>, String> value;
}

class CbjCompLastKnownIp extends CbjCompValueObjectAbstract<String> {
  factory CbjCompLastKnownIp(String input) {
    return CbjCompLastKnownIp._(
      validateCBJCompNotEmpty(input)
          .flatMap((a) => validateCBJCompTypeExist(input)),
    );
  }

  const CbjCompLastKnownIp._(this.value);

  @override
  final Either<CbjCompFailure<String>, String> value;
}
