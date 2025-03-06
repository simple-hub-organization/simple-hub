import 'package:freezed_annotation/freezed_annotation.dart';

part 'software_info_failures.freezed.dart';

@freezed
class SoftwareInfoFailures<T> {
  const factory SoftwareInfoFailures.empty({
    required T failedValue,
  }) = _Empty;

  const factory SoftwareInfoFailures.unexpected() = _Unexpected;

  const factory SoftwareInfoFailures.insufficientPermission() =
      _InsufficientPermission;

  const factory SoftwareInfoFailures.unableToUpdate() = _UnableToUpdate;
}
