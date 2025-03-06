import 'package:cybearjinni/domain/manage_network/manage_network_errors.dart';
import 'package:cybearjinni/domain/manage_network/manage_network_failures.dart';
import 'package:cybearjinni/domain/manage_network/manage_network_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ManageNetworkValueObjectAbstract<T> {
  const ManageNetworkValueObjectAbstract();

  Either<ManageNetworkFailures<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ManageWiFiFailures]
  T getOrCrash() {
    return value.fold((f) => throw ManageNetworkUnexpectedValueError(f), id);
  }

  Either<ManageNetworkFailures<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';

  @override
  @nonVirtual
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ManageNetworkValueObjectAbstract<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class ManageWiFiName extends ManageNetworkValueObjectAbstract<String> {
  factory ManageWiFiName(String input) {
    return ManageWiFiName._(
      validateMangageNetworkNameEmpty(input),
    );
  }

  const ManageWiFiName._(this.value);

  @override
  final Either<ManageNetworkFailures<String>, String> value;
}

class ManageWiFiPass extends ManageNetworkValueObjectAbstract<String> {
  factory ManageWiFiPass(String input) {
    return ManageWiFiPass._(
      validateMangageNetworkNameEmpty(input),
    );
  }

  const ManageWiFiPass._(this.value);

  @override
  final Either<ManageNetworkFailures<String>, String> value;
}
