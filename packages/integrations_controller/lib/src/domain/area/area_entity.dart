import 'dart:collection';

import 'package:integrations_controller/src/domain/area/area_failures.dart';
import 'package:integrations_controller/src/domain/area/value_objects_area.dart';
import 'package:integrations_controller/src/infrastructure/area/area_entity_dtos.dart';
import 'package:integrations_controller/src/infrastructure/core/utils.dart';
import 'package:dartz/dartz.dart';

class AreaEntity {
  AreaEntity({
    required this.uniqueId,
    required this.cbjEntityName,
    required this.background,
    required this.purposes,
    required this.entitiesId,
    required this.scenesId,
    required this.routinesId,
    required this.bindingsId,

    /// Who is using this area
    required this.areaMostUsedBy,

    /// Area permissions by users id
    required this.areaPermissions,
  });

  factory AreaEntity.empty() => AreaEntity(
        uniqueId: AreaUniqueId(),
        cbjEntityName: AreaDefaultName('Empty Area Name'),
        background: AreaBackground(
          'https://live.staticflickr.com/5220/5486044345_f67abff3e9_h.jpg',
        ),
        entitiesId: AreaEntitiesId(const {}),
        scenesId: AreaScenesId(const {}),
        routinesId: AreaRoutinesId(const {}),
        bindingsId: AreaBindingsId(const {}),
        areaMostUsedBy: AreaMostUsedBy(const {}),
        areaPermissions: AreaPermissions(const {}),
        purposes: AreaPurposes(const {}),
      );

  AreaUniqueId uniqueId;
  AreaDefaultName cbjEntityName;
  AreaBackground background;
  AreaPurposes purposes;
  AreaEntitiesId entitiesId;
  AreaScenesId scenesId;
  AreaRoutinesId routinesId;
  AreaBindingsId bindingsId;

  /// Who is using this area
  AreaMostUsedBy areaMostUsedBy;

  /// Area permissions by users id
  AreaPermissions areaPermissions;

  /// Will add new device id to the devices in the area list
  void addEntities(HashSet<String> devices) {
    final Set<String> tempList = {};
    tempList.addAll(entitiesId.getOrCrash());
    tempList.addAll(devices);
    try {
      entitiesId = AreaEntitiesId(tempList);
    } catch (e) {
      icLogger.e('addDeviceId will not work if list got created with const');
    }
  }

  /// Will add new scene id to the scenes in the area list
  void addSceneId(String newSceneId) {
    final Set<String> tempList = {};
    tempList.addAll(scenesId.getOrCrash());
    tempList.add(newSceneId);
    try {
      scenesId = AreaScenesId(tempList);
    } catch (e) {
      icLogger.e('addSceneId will not work if list got created with const');
    }
  }

  /// Will add new routine id to the scenes in the area list
  void addRoutineId(String newRoutineId) {
    final Set<String> tempList = {};
    tempList.addAll(routinesId.getOrCrash());
    tempList.add(newRoutineId);
    try {
      routinesId = AreaRoutinesId(tempList);
    } catch (e) {
      icLogger.e('addRoutineId will not work if list got created with const');
    }
  }

  /// Will add new Binding id to the scenes in the area list
  void addBindingId(String newSceneId) {
    try {
      bindingsId.getOrCrash().add(newSceneId);
    } catch (e) {
      icLogger.e('addBindingId will not work if list got created with const');
    }
  }

  Option<AreaFailure<dynamic>> get failureOption {
    return cbjEntityName.value.fold((f) => some(f), (_) => none());
  }

  AreaEntityDtos toInfrastructure() {
    return AreaEntityDtos(
      uniqueId: uniqueId.getOrCrash(),
      cbjEntityName: cbjEntityName.getOrCrash(),
      background: background.getOrCrash(),
      areaTypes: purposes.getOrCrash(),
      areaDevicesId: entitiesId.getOrCrash(),
      areaScenesId: scenesId.getOrCrash(),
      areaRoutinesId: routinesId.getOrCrash(),
      areaBindingsId: bindingsId.getOrCrash(),
      areaMostUsedBy: areaMostUsedBy.getOrCrash(),
      areaPermissions: areaPermissions.getOrCrash(),
    );
  }

  AreaEntity copy({
    AreaUniqueId? uniqueId,
    AreaDefaultName? cbjEntityName,
    AreaBackground? background,
    AreaPurposes? purposes,
    AreaEntitiesId? entitiesId,
    AreaScenesId? scenesId,
    AreaRoutinesId? routinesId,
    AreaBindingsId? bindingsId,
    AreaMostUsedBy? areaMostUsedBy,
    AreaPermissions? areaPermissions,
  }) =>
      AreaEntity(
        uniqueId: uniqueId ?? this.uniqueId,
        cbjEntityName: cbjEntityName ?? this.cbjEntityName,
        background: background ?? this.background,
        purposes: purposes ?? this.purposes,
        entitiesId: entitiesId ?? this.entitiesId,
        scenesId: scenesId ?? this.scenesId,
        routinesId: routinesId ?? this.routinesId,
        bindingsId: bindingsId ?? this.bindingsId,
        areaMostUsedBy: areaMostUsedBy ?? this.areaMostUsedBy,
        areaPermissions: areaPermissions ?? this.areaPermissions,
      );
}
