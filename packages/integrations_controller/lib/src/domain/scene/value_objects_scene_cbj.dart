import 'dart:collection';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:integrations_controller/src/domain/scene/scene_cbj_errors.dart';
import 'package:integrations_controller/src/domain/scene/scene_cbj_failures.dart';
import 'package:integrations_controller/src/domain/scene/scene_cbj_validators.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObjectScenesCbj<T> {
  const ValueObjectScenesCbj();

  Either<SceneCbjFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [AuthValueFailure]
  T getOrCrash() {
    return value.fold((f) => throw SceneCbjUnexpectedValueError(f), id);
  }

  Either<SceneCbjFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';

  @override
  @nonVirtual
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObjectScenesCbj<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class SceneUniqueId extends ValueObjectScenesCbj<String> {
  factory SceneUniqueId() {
    return SceneUniqueId._(right(const Uuid().v1()));
  }

  factory SceneUniqueId.fromUniqueString(String uniqueId) {
    return SceneUniqueId._(right(uniqueId));
  }

  factory SceneUniqueId.discoveredSceneId() {
    return SceneUniqueId._(right('00000000-0000-0000-0000-000000000000'));
  }

  const SceneUniqueId._(this.value);

  @override
  final Either<SceneCbjFailure<String>, String> value;
}

class SceneCbjName extends ValueObjectScenesCbj<String> {
  factory SceneCbjName(String input) {
    return SceneCbjName._(
      validateSceneNotEmpty(input)
          .flatMap((a) => validateSceneMaxNameLength(input, maxLength)),
    );
  }

  factory SceneCbjName.discoveredSceneName() {
    return SceneCbjName._(right('Discovered'));
  }

  const SceneCbjName._(this.value);

  @override
  final Either<SceneCbjFailure<String>, String> value;

  static const maxLength = 1000;
}

class SceneCbjBackgroundColor extends ValueObjectScenesCbj<String> {
  factory SceneCbjBackgroundColor(String input) {
    return SceneCbjBackgroundColor._(
      validateSceneCbjBackgroundColorNotEmpty(input),
    );
  }

  const SceneCbjBackgroundColor._(this.value);

  @override
  final Either<SceneCbjFailure<String>, String> value;
}

class SceneCbjNodeRedFlowId extends ValueObjectScenesCbj<String?> {
  factory SceneCbjNodeRedFlowId(String? input) {
    return SceneCbjNodeRedFlowId._(validateSceneCbjNodeRedFlowId(input));
  }

  const SceneCbjNodeRedFlowId._(this.value);

  @override
  final Either<SceneCbjFailure<String?>, String?> value;
}

class SceneCbjFirstNodeId extends ValueObjectScenesCbj<String?> {
  factory SceneCbjFirstNodeId(String? input) {
    return SceneCbjFirstNodeId._(validateSceneCbjFirstNodeId(input));
  }

  const SceneCbjFirstNodeId._(this.value);

  @override
  final Either<SceneCbjFailure<String?>, String?> value;
}

class SceneCbjIconCodePoint extends ValueObjectScenesCbj<String?> {
  factory SceneCbjIconCodePoint(String? input) {
    return SceneCbjIconCodePoint._(validateSceneCbjIconCodePoint(input));
  }

  const SceneCbjIconCodePoint._(this.value);

  @override
  final Either<SceneCbjFailure<String?>, String?> value;
}

class SceneCbjBackgroundImage extends ValueObjectScenesCbj<String?> {
  factory SceneCbjBackgroundImage(String? input) {
    return SceneCbjBackgroundImage._(validateSceneCbjIconCodePoint(input));
  }

  const SceneCbjBackgroundImage._(this.value);

  @override
  final Either<SceneCbjFailure<String?>, String?> value;
}

class SceneCbjLastDateOfExecute extends ValueObjectScenesCbj<String?> {
  factory SceneCbjLastDateOfExecute(String? input) {
    return SceneCbjLastDateOfExecute._(validateSceneCbjIconCodePoint(input));
  }

  const SceneCbjLastDateOfExecute._(this.value);

  @override
  final Either<SceneCbjFailure<String?>, String?> value;
}

class SceneCbjStateMassage extends ValueObjectScenesCbj<String?> {
  factory SceneCbjStateMassage(String? input) {
    return SceneCbjStateMassage._(validateSceneCbjStateMassage(input));
  }

  const SceneCbjStateMassage._(this.value);

  @override
  final Either<SceneCbjFailure<String?>, String?> value;
}

class SceneCbjSenderDeviceOs extends ValueObjectScenesCbj<String?> {
  factory SceneCbjSenderDeviceOs(String? input) {
    return SceneCbjSenderDeviceOs._(validateSceneCbjSenderDeviceOs(input));
  }

  const SceneCbjSenderDeviceOs._(this.value);

  @override
  final Either<SceneCbjFailure<String?>, String?> value;
}

class SceneCbjSenderDeviceModel extends ValueObjectScenesCbj<String?> {
  factory SceneCbjSenderDeviceModel(String? input) {
    return SceneCbjSenderDeviceModel._(
      validateSceneCbjSenderDeviceModel(input),
    );
  }

  const SceneCbjSenderDeviceModel._(this.value);

  @override
  final Either<SceneCbjFailure<String?>, String?> value;
}

class SceneCbjSenderId extends ValueObjectScenesCbj<String?> {
  factory SceneCbjSenderId(String? input) {
    return SceneCbjSenderId._(validateSceneCbjSenderId(input));
  }

  const SceneCbjSenderId._(this.value);

  @override
  final Either<SceneCbjFailure<String?>, String?> value;
}

class SceneCbjCompUuid extends ValueObjectScenesCbj<String?> {
  factory SceneCbjCompUuid(String? input) {
    return SceneCbjCompUuid._(validateSceneCbjCompUuid(input));
  }

  const SceneCbjCompUuid._(this.value);

  @override
  final Either<SceneCbjFailure<String?>, String?> value;
}

class SceneCbjDeviceStateGRPC extends ValueObjectScenesCbj<String?> {
  factory SceneCbjDeviceStateGRPC(String? input) {
    return SceneCbjDeviceStateGRPC._(
      validateSceneCbjDeviceStateGRPC(input!)
          .flatMap((a) => validateSceneStateExist(input)),
    );
  }

  const SceneCbjDeviceStateGRPC._(this.value);

  @override
  final Either<SceneCbjFailure<String?>, String?> value;
}

class EntitiesWithAutomaticPurpose
    extends ValueObjectScenesCbj<HashSet<String>> {
  factory EntitiesWithAutomaticPurpose(HashSet<String> input) {
    return EntitiesWithAutomaticPurpose._(right(input));
  }

  const EntitiesWithAutomaticPurpose._(this.value);

  @override
  final Either<SceneCbjFailure<HashSet<String>>, HashSet<String>> value;
}
