import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_db_failures.freezed.dart';

@freezed
class LocalDbFailures<T> {
  const factory LocalDbFailures.empty({
    required T failedValue,
  }) = _Empty;

  const factory LocalDbFailures.unexpected() = _Unexpected;

  const factory LocalDbFailures.validateEmailNotEmpty() =
      _ValidateEmailNotEmpty;

  const factory LocalDbFailures.insufficientPermission() =
      _InsufficientPermission;

  const factory LocalDbFailures.unableToUpdate() = _UnableToUpdate;
}
