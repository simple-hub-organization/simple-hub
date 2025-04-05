import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/core/value_objects.dart';
import 'package:integrations_controller/src/domain/scene/scene_cbj_entity.dart';
import 'package:integrations_controller/src/domain/scene/value_objects_scene_cbj.dart';

part 'scene_cbj_dtos.freezed.dart';
part 'scene_cbj_dtos.g.dart';

@freezed
abstract class SceneDtos implements _$SceneDtos {
  factory SceneDtos({
    // @JsonKey(ignore: true)
    required String uniqueId,
    required String name,
    required String backgroundColor,
    required String? entityStateGRPC,
    required String? senderDeviceOs,
    required String? senderDeviceModel,
    required String? senderId,
    required String? compUuid,
    required String? stateMassage,
    required String areaPurposeType,
    required List<String> entitiesWithAutomaticPurpose,
    String? nodeRedFlowId,
    String? firstNodeId,
    String? iconCodePoint,
    String? image,
    String? lastDateOfExecute,
    // required ServerTimestampConverter() FieldValue serverTimeStamp,
  }) = _SceneDtos;

  SceneDtos._();

  factory SceneDtos.fromDomain(SceneEntity sceneCbj) {
    return SceneDtos(
      uniqueId: sceneCbj.uniqueId.getOrCrash(),
      name: sceneCbj.name.getOrCrash(),
      backgroundColor: sceneCbj.backgroundColor.getOrCrash(),
      nodeRedFlowId: sceneCbj.nodeRedFlowId.getOrCrash(),
      firstNodeId: sceneCbj.firstNodeId.getOrCrash(),
      iconCodePoint: sceneCbj.iconCodePoint.getOrCrash(),
      image: sceneCbj.image.getOrCrash(),
      lastDateOfExecute: sceneCbj.lastDateOfExecute.getOrCrash(),
      entityStateGRPC: sceneCbj.entityStateGRPC.getOrCrash(),
      senderDeviceModel: sceneCbj.senderDeviceModel.getOrCrash(),
      senderDeviceOs: sceneCbj.senderDeviceOs.getOrCrash(),
      senderId: sceneCbj.senderId.getOrCrash(),
      compUuid: sceneCbj.compUuid.getOrCrash(),
      stateMassage: sceneCbj.stateMassage.getOrCrash(),
      areaPurposeType: sceneCbj.areaPurposeType.name,
      entitiesWithAutomaticPurpose:
          sceneCbj.entitiesWithAutomaticPurpose.getOrCrash().toList(),
    );
  }

  factory SceneDtos.fromJson(Map<String, dynamic> json) =>
      _$SceneDtosFromJson(json);

  final String deviceDtoClassInstance = (SceneDtos).toString();

  SceneEntity toDomain() {
    return SceneEntity(
      uniqueId: UniqueId.fromUniqueString(uniqueId),
      name: SceneCbjName(name),
      backgroundColor: SceneCbjBackgroundColor(backgroundColor),
      nodeRedFlowId: SceneCbjNodeRedFlowId(nodeRedFlowId),
      firstNodeId: SceneCbjFirstNodeId(firstNodeId),
      iconCodePoint: SceneCbjIconCodePoint(iconCodePoint),
      image: SceneCbjBackgroundImage(image),
      lastDateOfExecute: SceneCbjLastDateOfExecute(lastDateOfExecute),
      entityStateGRPC: SceneCbjDeviceStateGRPC(entityStateGRPC),
      senderDeviceModel: SceneCbjSenderDeviceModel(senderDeviceModel),
      senderDeviceOs: SceneCbjSenderDeviceOs(senderDeviceOs),
      senderId: SceneCbjSenderId(senderId),
      compUuid: SceneCbjCompUuid(compUuid),
      stateMassage: SceneCbjStateMassage(stateMassage),
      actions: [],
      areaPurposeType: AreaPurposesTypesExtension.fromString(areaPurposeType),
      entitiesWithAutomaticPurpose: EntitiesWithAutomaticPurpose(
        HashSet.from(entitiesWithAutomaticPurpose),
      ),
    );
  }
}
