import 'package:cybearjinni/domain/security_bear/security_bear_errors.dart';
import 'package:cybearjinni/domain/security_bear/security_bear_failures.dart';
import 'package:cybearjinni/domain/security_bear/security_bear_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class SecurityBearValueObjectAbstract<T> {
  const SecurityBearValueObjectAbstract();

  Either<SecurityBearFailures<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [SecurityBearFailures]
  T getOrCrash() {
    return value.fold((f) => throw SecurityBearUnexpectedValueError(f), id);
  }

  Either<SecurityBearFailures<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';

  @override
  @nonVirtual
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SecurityBearValueObjectAbstract<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class SecurityBearNetworkIp extends SecurityBearValueObjectAbstract<String> {
  factory SecurityBearNetworkIp(String input) {
    return SecurityBearNetworkIp._(
      validateStringNotEmpty(input),
    );
  }

  const SecurityBearNetworkIp._(this.value);

  @override
  final Either<SecurityBearFailures<String>, String> value;
}

class SecurityBearMdnsName extends SecurityBearValueObjectAbstract<String> {
  factory SecurityBearMdnsName(String input) {
    return SecurityBearMdnsName._(
      validateStringNotEmpty(input),
    );
  }

  const SecurityBearMdnsName._(this.value);

  @override
  final Either<SecurityBearFailures<String>, String> value;
}

class SecurityBearNetworkBssid extends SecurityBearValueObjectAbstract<String> {
  factory SecurityBearNetworkBssid(String input) {
    return SecurityBearNetworkBssid._(
      validateStringNotEmpty(input),
    );
  }

  const SecurityBearNetworkBssid._(this.value);

  @override
  final Either<SecurityBearFailures<String>, String> value;
}

class SecurityBearNetworkName extends SecurityBearValueObjectAbstract<String> {
  factory SecurityBearNetworkName(String input) {
    return SecurityBearNetworkName._(
      validateStringNotEmpty(input),
    );
  }

  const SecurityBearNetworkName._(this.value);

  @override
  final Either<SecurityBearFailures<String>, String> value;
}
