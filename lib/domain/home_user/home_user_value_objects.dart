import 'package:cybearjinni/domain/home_user/home_user_errors.dart';
import 'package:cybearjinni/domain/home_user/home_user_failures.dart';
import 'package:cybearjinni/domain/home_user/home_user_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:uuid/uuid.dart';

@immutable
abstract class HomeUserValueObjectAbstract<T> {
  const HomeUserValueObjectAbstract();

  Either<HomeUserFailures<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [UserFailures]
  T getOrCrash() {
    return value.fold((f) => throw HomeUserUnexpectedValueError(f), id);
  }

  Either<HomeUserFailures<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';

  @override
  @nonVirtual
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is HomeUserValueObjectAbstract<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class HomeUserUniqueId extends HomeUserValueObjectAbstract<String?> {
  factory HomeUserUniqueId() {
    return HomeUserUniqueId._(right(const Uuid().v1()));
  }

  factory HomeUserUniqueId.fromUniqueString(String? uniqueId) {
    assert(uniqueId != null);
    return HomeUserUniqueId._(right(uniqueId!));
  }

  const HomeUserUniqueId._(this.value);

  @override
  final Either<HomeUserFailures<String>, String> value;
}

class HomeUserEmail extends HomeUserValueObjectAbstract<String?> {
  factory HomeUserEmail(String? input) {
    assert(input != null);
    return HomeUserEmail._(
      validateHomeUserEmailNotEmpty(input),
    );
  }

  const HomeUserEmail._(this.value);

  @override
  final Either<HomeUserFailures<String?>, String?> value;

  static const maxLength = 1000;
}

class HomeUserName extends HomeUserValueObjectAbstract<String?> {
  factory HomeUserName(String input) {
    return HomeUserName._(
      validateHomeUserNameNotEmpty(input),
    );
  }

  const HomeUserName._(this.value);

  @override
  final Either<HomeUserFailures<String>, String> value;

  static const maxLength = 1000;
}

class HomeUserPermission extends HomeUserValueObjectAbstract<String?> {
  factory HomeUserPermission(String input) {
    return HomeUserPermission._(
      validateHomeUserNameNotEmpty(input),
    );
  }

  const HomeUserPermission._(this.value);

  @override
  final Either<HomeUserFailures<String>, String> value;

  static const maxLength = 1000;
}
