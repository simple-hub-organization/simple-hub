import 'package:freezed_annotation/freezed_annotation.dart';

part 'scene_cbj_failures.freezed.dart';

@freezed
class SceneCbjFailure<T> {
  const factory SceneCbjFailure.unexpected() = _Unexpected;

  const factory SceneCbjFailure.insufficientPermission() =
      _InsufficientPermission;

  const factory SceneCbjFailure.unableToUpdate() = _UnableToUpdate;

  const factory SceneCbjFailure.empty({
    required T failedValue,
  }) = _Empty;

  const factory SceneCbjFailure.actionExcecuter({
    required T failedValue,
  }) = _ActionExcecuter;

  const factory SceneCbjFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = _ExceedingLength;

  const factory SceneCbjFailure.powerConsumptionIsNotNumber() =
      _PowerConsumptionIsNotNumber;

  const factory SceneCbjFailure.areasActionDoesNotExist() =
      _AreasActionDoesNotExist;

  const factory SceneCbjFailure.areasTypeDoesNotExist() =
      _AreasTypeDoesNotExist;

  const factory SceneCbjFailure.sceneStateDoesNotExist() =
      _SceneStateDoesNotExist;
}
