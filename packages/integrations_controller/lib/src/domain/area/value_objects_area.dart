import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:integrations_controller/src/domain/area/area_errors.dart';
import 'package:integrations_controller/src/domain/area/area_failures.dart';
import 'package:integrations_controller/src/domain/area/area_validators.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObjectAreas<T> {
  const ValueObjectAreas();

  Either<AreaFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [AuthValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw AreaUnexpectedValueError(f), id);
  }

  Either<AreaFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';

  @override
  @nonVirtual
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObjectAreas<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class AreaUniqueId extends ValueObjectAreas<String> {
  factory AreaUniqueId() {
    return AreaUniqueId._(right(const Uuid().v1()));
  }

  factory AreaUniqueId.fromUniqueString(String uniqueId) {
    return AreaUniqueId._(right(uniqueId));
  }

  factory AreaUniqueId.discovered() {
    return AreaUniqueId._(right(discovereId));
  }
  const AreaUniqueId._(this.value);

  static const String discovereId = '00000000-0000-0000-0000-000000000000';

  @override
  final Either<AreaFailure<String>, String> value;
}

class AreaDefaultName extends ValueObjectAreas<String> {
  factory AreaDefaultName(String input) {
    return AreaDefaultName._(
      validateAreaNotEmpty(input)
          .flatMap((a) => validateAreaMaxNameLength(input, maxLength)),
    );
  }

  factory AreaDefaultName.discoveredAreaName() {
    return AreaDefaultName._(right('Discovered'));
  }

  const AreaDefaultName._(this.value);

  @override
  final Either<AreaFailure<String>, String> value;

  static const maxLength = 1000;
}

/// Can be an image or a color hex value
class AreaBackground extends ValueObjectAreas<String> {
  factory AreaBackground(String input) {
    return AreaBackground._(
      validateAreaBackgroundNotEmpty(input),
    );
  }

  const AreaBackground._(this.value);

  @override
  final Either<AreaFailure<String>, String> value;
}

class AreaPurposes extends ValueObjectAreas<Set<String>> {
  factory AreaPurposes(Set<AreaPurposesTypes> input) {
    return AreaPurposes._(input, right(input.map((e) => e.name).toSet()));
  }

  const AreaPurposes._(this.types, this.value);

  final Set<AreaPurposesTypes> types;

  @override
  final Either<AreaFailure<Set<String>>, Set<String>> value;
}

class AreaEntitiesId extends ValueObjectAreas<Set<String>> {
  factory AreaEntitiesId(Set<String> input) {
    return AreaEntitiesId._(right(input));
  }

  const AreaEntitiesId._(this.value);

  @override
  final Either<AreaFailure<Set<String>>, Set<String>> value;
}

class AreaScenesId extends ValueObjectAreas<Set<String>> {
  factory AreaScenesId(Set<String> input) {
    return AreaScenesId._(right(input));
  }

  const AreaScenesId._(this.value);

  @override
  final Either<AreaFailure<Set<String>>, Set<String>> value;
}

class AreaRoutinesId extends ValueObjectAreas<Set<String>> {
  factory AreaRoutinesId(Set<String> input) {
    return AreaRoutinesId._(right(input));
  }

  const AreaRoutinesId._(this.value);

  @override
  final Either<AreaFailure<Set<String>>, Set<String>> value;
}

class AreaBindingsId extends ValueObjectAreas<Set<String>> {
  factory AreaBindingsId(Set<String> input) {
    return AreaBindingsId._(right(input));
  }

  const AreaBindingsId._(this.value);

  @override
  final Either<AreaFailure<Set<String>>, Set<String>> value;
}

class AreaMostUsedBy extends ValueObjectAreas<Set<String>> {
  factory AreaMostUsedBy(Set<String> input) {
    return AreaMostUsedBy._(validateUserIdsValid(input));
  }

  const AreaMostUsedBy._(this.value);

  @override
  final Either<AreaFailure<Set<String>>, Set<String>> value;
}

class AreaPermissions extends ValueObjectAreas<Set<String>> {
  factory AreaPermissions(Set<String> input) {
    return AreaPermissions._(validateUserIdsValid(input));
  }

  const AreaPermissions._(this.value);

  @override
  final Either<AreaFailure<Set<String>>, Set<String>> value;
}
