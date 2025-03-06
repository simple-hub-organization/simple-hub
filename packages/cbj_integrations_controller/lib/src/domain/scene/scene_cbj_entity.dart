import 'package:cbj_integrations_controller/src/domain/core/request_action_object.dart';
import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/core/value_objects.dart';
import 'package:cbj_integrations_controller/src/domain/scene/value_objects_scene_cbj.dart';
import 'package:cbj_integrations_controller/src/infrastructure/scenes/scene_cbj_dtos.dart';

class SceneCbjEntity {
  const SceneCbjEntity({
    /// The unique id of the scene, will alsow be used as the flow/tab id.
    required this.uniqueId,

    /// Name of the automation, will be shown to the user.
    required this.name,
    required this.backgroundColor,

    /// Node-Red flow id of the scene
    required this.nodeRedFlowId,

    /// The actual id of the first node, most of the time will be the same as
    /// uniqueId variable.
    required this.firstNodeId,

    /// The Unicode code point at which this icon is stored in the icon font.
    required this.iconCodePoint,
    required this.image,
    required this.lastDateOfExecute,
    required this.stateMassage,
    required this.senderDeviceOs,
    required this.senderDeviceModel,
    required this.senderId,
    required this.compUuid,
    required this.entityStateGRPC,
    required this.actions,
    required this.areaPurposeType,
    required this.entitiesWithAutomaticPurpose,
  });

  final UniqueId uniqueId;
  final SceneCbjName name;
  final SceneCbjBackgroundColor backgroundColor;
  final SceneCbjNodeRedFlowId nodeRedFlowId;
  final SceneCbjFirstNodeId firstNodeId;
  final SceneCbjIconCodePoint iconCodePoint;
  final SceneCbjBackgroundImage image;
  final SceneCbjLastDateOfExecute lastDateOfExecute;
  final SceneCbjStateMassage stateMassage;
  final SceneCbjSenderDeviceOs senderDeviceOs;
  final SceneCbjSenderDeviceModel senderDeviceModel;
  final SceneCbjSenderId senderId;
  final SceneCbjCompUuid compUuid;
  final SceneCbjDeviceStateGRPC entityStateGRPC;

  final List<RequestActionObject> actions;
  final AreaPurposesTypes areaPurposeType;
  final EntitiesWithAutomaticPurpose entitiesWithAutomaticPurpose;

  SceneCbjEntity copyWith({
    UniqueId? uniqueId,
    SceneCbjName? name,
    SceneCbjBackgroundColor? backgroundColor,
    SceneCbjNodeRedFlowId? nodeRedFlowId,
    SceneCbjFirstNodeId? firstNodeId,
    SceneCbjIconCodePoint? iconCodePoint,
    SceneCbjBackgroundImage? image,
    SceneCbjLastDateOfExecute? lastDateOfExecute,
    SceneCbjStateMassage? stateMassage,
    SceneCbjSenderDeviceOs? senderDeviceOs,
    SceneCbjSenderDeviceModel? senderDeviceModel,
    SceneCbjSenderId? senderId,
    SceneCbjCompUuid? compUuid,
    SceneCbjDeviceStateGRPC? entityStateGRPC,
    List<RequestActionObject>? actions,
    AreaPurposesTypes? areaPurposeType,
    EntitiesWithAutomaticPurpose? entitiesWithAutomaticPurpose,
  }) =>
      SceneCbjEntity(
        uniqueId: uniqueId ?? this.uniqueId,
        name: name ?? this.name,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        nodeRedFlowId: nodeRedFlowId ?? this.nodeRedFlowId,
        firstNodeId: firstNodeId ?? this.firstNodeId,
        iconCodePoint: iconCodePoint ?? this.iconCodePoint,
        image: image ?? this.image,
        lastDateOfExecute: lastDateOfExecute ?? this.lastDateOfExecute,
        stateMassage: stateMassage ?? this.stateMassage,
        senderDeviceOs: senderDeviceOs ?? this.senderDeviceOs,
        senderDeviceModel: senderDeviceModel ?? this.senderDeviceModel,
        senderId: senderId ?? this.senderId,
        compUuid: compUuid ?? this.compUuid,
        entityStateGRPC: entityStateGRPC ?? this.entityStateGRPC,
        actions: actions ?? this.actions,
        areaPurposeType: areaPurposeType ?? this.areaPurposeType,
        entitiesWithAutomaticPurpose:
            entitiesWithAutomaticPurpose ?? this.entitiesWithAutomaticPurpose,
      );

  SceneCbjDtos toInfrastructure() => SceneCbjDtos(
        uniqueId: uniqueId.getOrCrash(),
        name: name.getOrCrash(),
        backgroundColor: backgroundColor.getOrCrash(),
        nodeRedFlowId: nodeRedFlowId.getOrCrash(),
        firstNodeId: firstNodeId.getOrCrash(),
        iconCodePoint: iconCodePoint.getOrCrash(),
        image: image.getOrCrash(),
        lastDateOfExecute: lastDateOfExecute.getOrCrash(),
        entityStateGRPC: entityStateGRPC.getOrCrash(),
        senderDeviceModel: senderDeviceModel.getOrCrash(),
        senderDeviceOs: senderDeviceOs.getOrCrash(),
        senderId: senderId.getOrCrash(),
        compUuid: compUuid.getOrCrash(),
        stateMassage: stateMassage.getOrCrash(),
        areaPurposeType: areaPurposeType.name,
        entitiesWithAutomaticPurpose:
            entitiesWithAutomaticPurpose.getOrCrash().toList(),
      );
}
