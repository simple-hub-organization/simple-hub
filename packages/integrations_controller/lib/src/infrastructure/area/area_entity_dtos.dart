import 'package:integrations_controller/src/domain/area/area_entity.dart';
import 'package:integrations_controller/src/domain/area/value_objects_area.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'area_entity_dtos.freezed.dart';
part 'area_entity_dtos.g.dart';

@freezed
abstract class AreaEntityDtos implements _$AreaEntityDtos {
  factory AreaEntityDtos({
    required String uniqueId,
    required String cbjEntityName,
    required String background,
    required Set<String> areaTypes,
    required Set<String> areaDevicesId,
    required Set<String> areaScenesId,
    required Set<String> areaRoutinesId,
    required Set<String> areaBindingsId,

    /// Who is using this area
    required Set<String> areaMostUsedBy,

    /// Area permissions by users id
    required Set<String> areaPermissions,

    // required ServerTimestampConverter() FieldValue serverTimeStamp,
  }) = _AreaEntityDtos;

  AreaEntityDtos._();

  factory AreaEntityDtos.fromDomain(AreaEntity areaEntityDE) {
    return AreaEntityDtos(
      uniqueId: areaEntityDE.uniqueId.getOrCrash(),
      cbjEntityName: areaEntityDE.cbjEntityName.getOrCrash(),
      background: areaEntityDE.background.getOrCrash(),
      areaTypes: areaEntityDE.purposes.getOrCrash(),
      areaDevicesId: areaEntityDE.entitiesId.getOrCrash(),
      areaScenesId: areaEntityDE.scenesId.getOrCrash(),
      areaRoutinesId: areaEntityDE.routinesId.getOrCrash(),
      areaBindingsId: areaEntityDE.bindingsId.getOrCrash(),
      areaMostUsedBy: areaEntityDE.areaMostUsedBy.getOrCrash(),
      areaPermissions: areaEntityDE.areaPermissions.getOrCrash(),
    );
  }

  factory AreaEntityDtos.fromJson(Map<String, dynamic> json) =>
      _$AreaEntityDtosFromJson(json);

  AreaEntity toDomain() {
    return AreaEntity(
      uniqueId: AreaUniqueId.fromUniqueString(uniqueId),
      cbjEntityName: AreaDefaultName(cbjEntityName),
      background: AreaBackground(background),
      purposes: AreaPurposes(
        areaTypes.map((e) => AreaPurposesTypesExtension.fromString(e)).toSet(),
      ),
      entitiesId: AreaEntitiesId(areaDevicesId),
      scenesId: AreaScenesId(areaScenesId),
      routinesId: AreaRoutinesId(areaRoutinesId),
      bindingsId: AreaBindingsId(areaBindingsId),
      areaMostUsedBy: AreaMostUsedBy(areaMostUsedBy),
      areaPermissions: AreaPermissions(areaPermissions),
    );
  }

  final String deviceDtoClassInstance = (AreaEntityDtos).toString();
}
