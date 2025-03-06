import 'package:cybearjinni/domain/software_info/software_info_errors.dart';
import 'package:cybearjinni/domain/software_info/software_info_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class SoftwareInfoValueObjectAbstract<T> {
  const SoftwareInfoValueObjectAbstract();

  Either<SoftwareInfoFailures<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ManageWiFiFailures]
  T getOrCrash() {
    return value.fold((f) => throw SoftwareInfoUnexpectedValueError(f), id);
  }

  Either<SoftwareInfoFailures<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';

  @override
  @nonVirtual
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SoftwareInfoValueObjectAbstract<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class SoftwareInfoDeviceName extends SoftwareInfoValueObjectAbstract<String> {
  factory SoftwareInfoDeviceName(String input) {
    return SoftwareInfoDeviceName._(right(input));
  }

  const SoftwareInfoDeviceName._(this.value);

  @override
  final Either<SoftwareInfoFailures<String>, String> value;
}

class SoftwareInfoPubspecYamlVersion
    extends SoftwareInfoValueObjectAbstract<String> {
  factory SoftwareInfoPubspecYamlVersion(String input) {
    return SoftwareInfoPubspecYamlVersion._(right(input));
  }

  const SoftwareInfoPubspecYamlVersion._(this.value);

  @override
  final Either<SoftwareInfoFailures<String>, String> value;
}

class SoftwareInfoProtoLastGenDate
    extends SoftwareInfoValueObjectAbstract<String> {
  factory SoftwareInfoProtoLastGenDate(String input) {
    return SoftwareInfoProtoLastGenDate._(right(input));
  }

  const SoftwareInfoProtoLastGenDate._(this.value);

  @override
  final Either<SoftwareInfoFailures<String>, String> value;
}

class SoftwareInfoDartSdkVersion
    extends SoftwareInfoValueObjectAbstract<String> {
  factory SoftwareInfoDartSdkVersion(String input) {
    return SoftwareInfoDartSdkVersion._(right(input));
  }

  const SoftwareInfoDartSdkVersion._(this.value);

  @override
  final Either<SoftwareInfoFailures<String>, String> value;
}

class SoftwareInfoCompId extends SoftwareInfoValueObjectAbstract<String> {
  factory SoftwareInfoCompId(String input) {
    return SoftwareInfoCompId._(right(input));
  }

  const SoftwareInfoCompId._(this.value);

  @override
  final Either<SoftwareInfoFailures<String>, String> value;
}

class SoftwareInfoCompUuid extends SoftwareInfoValueObjectAbstract<String> {
  factory SoftwareInfoCompUuid(String input) {
    return SoftwareInfoCompUuid._(right(input));
  }

  const SoftwareInfoCompUuid._(this.value);

  @override
  final Either<SoftwareInfoFailures<String>, String> value;
}

class SoftwareInfoCompOs extends SoftwareInfoValueObjectAbstract<String> {
  factory SoftwareInfoCompOs(String input) {
    return SoftwareInfoCompOs._(right(input));
  }

  const SoftwareInfoCompOs._(this.value);

  @override
  final Either<SoftwareInfoFailures<String>, String> value;
}

class SoftwareInfoCompModel extends SoftwareInfoValueObjectAbstract<String> {
  factory SoftwareInfoCompModel(String input) {
    return SoftwareInfoCompModel._(right(input));
  }

  const SoftwareInfoCompModel._(this.value);

  @override
  final Either<SoftwareInfoFailures<String>, String> value;
}

class SoftwareInfoCompType extends SoftwareInfoValueObjectAbstract<String> {
  factory SoftwareInfoCompType(String input) {
    return SoftwareInfoCompType._(right(input));
  }

  const SoftwareInfoCompType._(this.value);

  @override
  final Either<SoftwareInfoFailures<String>, String> value;
}

class SoftwareInfoCompIp extends SoftwareInfoValueObjectAbstract<String> {
  factory SoftwareInfoCompIp(String input) {
    return SoftwareInfoCompIp._(right(input));
  }

  const SoftwareInfoCompIp._(this.value);

  @override
  final Either<SoftwareInfoFailures<String>, String> value;
}
