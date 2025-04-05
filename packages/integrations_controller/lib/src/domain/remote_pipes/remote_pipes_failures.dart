import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_pipes_failures.freezed.dart';

@freezed
class RemotePipesFailures<T> {
  const factory RemotePipesFailures.empty({
    required T failedValue,
  }) = _Empty;

  const factory RemotePipesFailures.unexpected() = _Unexpected;

  const factory RemotePipesFailures.insufficientPermission() =
      _InsufficientPermission;

  const factory RemotePipesFailures.unableToUpdate() = _UnableToUpdate;
}
