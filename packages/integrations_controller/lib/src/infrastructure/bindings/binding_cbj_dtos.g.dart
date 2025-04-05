// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding_cbj_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BindingCbjDtosImpl _$$BindingCbjDtosImplFromJson(Map<String, dynamic> json) =>
    _$BindingCbjDtosImpl(
      uniqueId: json['uniqueId'] as String,
      name: json['name'] as String,
      backgroundColor: json['backgroundColor'] as String,
      entityStateGRPC: json['entityStateGRPC'] as String?,
      senderDeviceOs: json['senderDeviceOs'] as String?,
      senderDeviceModel: json['senderDeviceModel'] as String?,
      senderId: json['senderId'] as String?,
      compUuid: json['compUuid'] as String?,
      stateMassage: json['stateMassage'] as String?,
      automationString: json['automationString'] as String?,
      nodeRedFlowId: json['nodeRedFlowId'] as String?,
      firstNodeId: json['firstNodeId'] as String?,
      iconCodePoint: json['iconCodePoint'] as String?,
      image: json['image'] as String?,
      lastDateOfExecute: json['lastDateOfExecute'] as String?,
    );

Map<String, dynamic> _$$BindingCbjDtosImplToJson(
        _$BindingCbjDtosImpl instance) =>
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
      'automationString': instance.automationString,
      'nodeRedFlowId': instance.nodeRedFlowId,
      'firstNodeId': instance.firstNodeId,
      'iconCodePoint': instance.iconCodePoint,
      'image': instance.image,
      'lastDateOfExecute': instance.lastDateOfExecute,
    };
