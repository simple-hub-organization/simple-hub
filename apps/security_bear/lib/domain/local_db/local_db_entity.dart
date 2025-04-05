import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:security_bear/domain/local_db/local_db_failures.dart';
import 'package:security_bear/domain/local_db/local_db_value_objects.dart';

part 'local_db_entity.freezed.dart';

@freezed
abstract class LocalDbEntity implements _$LocalDbEntity {
  const factory LocalDbEntity({
    required LocalDbUniqueId? id,
    required LocalDbEmail? email,
    required LocalDbName? name,
    LocalDbPass? pass,
    LocalDbFirstName? firstName,
    LocalDbLastName? lastName,
  }) = _LocalDbEntity;

  const LocalDbEntity._();

  factory LocalDbEntity.empty() => LocalDbEntity(
        id: LocalDbUniqueId(),
        email: LocalDbEmail(''),
        name: LocalDbName(''),
      );

  Option<LocalDbFailures<dynamic>> get failureOption {
    return email!.value.fold((f) => some(f), (_) => none());
  }
}
