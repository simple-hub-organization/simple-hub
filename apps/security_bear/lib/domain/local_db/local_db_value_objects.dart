import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:security_bear/domain/local_db/local_db_errors.dart';
import 'package:security_bear/domain/local_db/local_db_failures.dart';
import 'package:security_bear/domain/local_db/local_db_validators.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class LocalDbValueObjectAbstract<T> {
  const LocalDbValueObjectAbstract();

  Either<LocalDbFailures<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [LocalDbFailures]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw LocalDbUnexpectedValueError(f), id);
  }

  Either<LocalDbFailures<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';

  @override
  @nonVirtual
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalDbValueObjectAbstract<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class LocalDbUniqueId extends LocalDbValueObjectAbstract<String?> {
  factory LocalDbUniqueId() {
    return LocalDbUniqueId._(right(const Uuid().v1()));
  }

  factory LocalDbUniqueId.fromUniqueString(String? uniqueId) {
    assert(uniqueId != null);
    return LocalDbUniqueId._(right(uniqueId!));
  }

  const LocalDbUniqueId._(this.value);

  @override
  final Either<LocalDbFailures<String>, String> value;
}

class LocalDbEmail extends LocalDbValueObjectAbstract<String> {
  factory LocalDbEmail(String input) {
    return LocalDbEmail._(
      validateLocalDbEmailNotEmpty(input),
    );
  }

  const LocalDbEmail._(this.value);

  @override
  final Either<LocalDbFailures<String>, String> value;

  static const maxLength = 1000;
}

class LocalDbName extends LocalDbValueObjectAbstract<String> {
  factory LocalDbName(String input) {
    return LocalDbName._(
      validateLocalDbNameNotEmpty(input),
    );
  }

  const LocalDbName._(this.value);

  @override
  final Either<LocalDbFailures<String>, String> value;

  static const maxLength = 1000;
}

class LocalDbPass extends LocalDbValueObjectAbstract<String> {
  factory LocalDbPass(String input) {
    return LocalDbPass._(
      validateLocalDbNameNotEmpty(input),
    );
  }

  const LocalDbPass._(this.value);

  @override
  final Either<LocalDbFailures<String>, String> value;

  static const maxLength = 1000;
}

class LocalDbFirstName extends LocalDbValueObjectAbstract<String> {
  factory LocalDbFirstName(String input) {
    return LocalDbFirstName._(
      validateLocalDbNameNotEmpty(input),
    );
  }

  const LocalDbFirstName._(this.value);

  @override
  final Either<LocalDbFailures<String>, String> value;

  static const maxLength = 1000;
}

class LocalDbLastName extends LocalDbValueObjectAbstract<String> {
  factory LocalDbLastName(String input) {
    return LocalDbLastName._(
      validateLocalDbNameNotEmpty(input),
    );
  }

  const LocalDbLastName._(this.value);

  @override
  final Either<LocalDbFailures<String>, String> value;

  static const maxLength = 1000;
}
