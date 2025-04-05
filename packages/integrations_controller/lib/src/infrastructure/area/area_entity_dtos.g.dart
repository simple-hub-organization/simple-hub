// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_entity_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AreaEntityDtosImpl _$$AreaEntityDtosImplFromJson(Map<String, dynamic> json) =>
    _$AreaEntityDtosImpl(
      uniqueId: json['uniqueId'] as String,
      cbjEntityName: json['cbjEntityName'] as String,
      background: json['background'] as String,
      areaTypes:
          (json['areaTypes'] as List<dynamic>).map((e) => e as String).toSet(),
      areaDevicesId: (json['areaDevicesId'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      areaScenesId: (json['areaScenesId'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      areaRoutinesId: (json['areaRoutinesId'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      areaBindingsId: (json['areaBindingsId'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      areaMostUsedBy: (json['areaMostUsedBy'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      areaPermissions: (json['areaPermissions'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
    );

Map<String, dynamic> _$$AreaEntityDtosImplToJson(
        _$AreaEntityDtosImpl instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'cbjEntityName': instance.cbjEntityName,
      'background': instance.background,
      'areaTypes': instance.areaTypes.toList(),
      'areaDevicesId': instance.areaDevicesId.toList(),
      'areaScenesId': instance.areaScenesId.toList(),
      'areaRoutinesId': instance.areaRoutinesId.toList(),
      'areaBindingsId': instance.areaBindingsId.toList(),
      'areaMostUsedBy': instance.areaMostUsedBy.toList(),
      'areaPermissions': instance.areaPermissions.toList(),
    };
