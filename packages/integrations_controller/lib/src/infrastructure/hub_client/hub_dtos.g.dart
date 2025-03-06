// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hub_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HubDtosImpl _$$HubDtosImplFromJson(Map<String, dynamic> json) =>
    _$HubDtosImpl(
      hubNetworkBssid: json['hubNetworkBssid'] as String,
      networkName: json['networkName'] as String,
      lastKnownIp: json['lastKnownIp'] as String,
    );

Map<String, dynamic> _$$HubDtosImplToJson(_$HubDtosImpl instance) =>
    <String, dynamic>{
      'hubNetworkBssid': instance.hubNetworkBssid,
      'networkName': instance.networkName,
      'lastKnownIp': instance.lastKnownIp,
    };
