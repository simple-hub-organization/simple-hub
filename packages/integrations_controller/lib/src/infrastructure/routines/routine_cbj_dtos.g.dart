// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_cbj_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoutineCbjDtosImpl _$$RoutineCbjDtosImplFromJson(Map<String, dynamic> json) =>
    _$RoutineCbjDtosImpl(
      uniqueId: json['uniqueId'] as String,
      name: json['name'] as String,
      backgroundColor: json['backgroundColor'] as String,
      entityStateGRPC: json['entityStateGRPC'] as String?,
      senderDeviceOs: json['senderDeviceOs'] as String?,
      senderDeviceModel: json['senderDeviceModel'] as String?,
      senderId: json['senderId'] as String?,
      compUuid: json['compUuid'] as String?,
      stateMassage: json['stateMassage'] as String?,
      repeateType: json['repeateType'] as String?,
      repeateDateDays: (json['repeateDateDays'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      repeateDateHour: json['repeateDateHour'] as String?,
      repeateDateMinute: json['repeateDateMinute'] as String?,
      automationString: json['automationString'] as String?,
      nodeRedFlowId: json['nodeRedFlowId'] as String?,
      firstNodeId: json['firstNodeId'] as String?,
      iconCodePoint: json['iconCodePoint'] as String?,
      image: json['image'] as String?,
      lastDateOfExecute: json['lastDateOfExecute'] as String?,
    );

Map<String, dynamic> _$$RoutineCbjDtosImplToJson(
        _$RoutineCbjDtosImpl instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'name': instance.name,
      'backgroundColor': instance.backgroundColor,
      'entityStateGRPC': instance.entityStateGRPC,
      'senderDeviceOs': instance.senderDeviceOs,
      'senderDeviceModel': instance.senderDeviceModel,
      'senderId': instance.senderId,
      'compUuid': instance.compUuid,
      'stateMassage': instance.stateMassage,
      'repeateType': instance.repeateType,
      'repeateDateDays': instance.repeateDateDays,
      'repeateDateHour': instance.repeateDateHour,
      'repeateDateMinute': instance.repeateDateMinute,
      'automationString': instance.automationString,
      'nodeRedFlowId': instance.nodeRedFlowId,
      'firstNodeId': instance.firstNodeId,
      'iconCodePoint': instance.iconCodePoint,
      'image': instance.image,
      'lastDateOfExecute': instance.lastDateOfExecute,
    };
