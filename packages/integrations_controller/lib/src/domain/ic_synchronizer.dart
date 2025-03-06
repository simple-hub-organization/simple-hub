import 'dart:async';
import 'dart:collection';

import 'package:integrations_controller/src/domain/area/area_entity.dart';
import 'package:integrations_controller/src/domain/area/i_area_repository.dart';
import 'package:integrations_controller/src/domain/core/request_action_object.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/vendor_entity_information.dart';
import 'package:integrations_controller/src/domain/networks_manager.dart';
import 'package:integrations_controller/src/domain/scene/scene_cbj_entity.dart';
import 'package:integrations_controller/src/domain/vendor_login_entity.dart';
import 'package:integrations_controller/src/infrastructure/automations_service.dart';
import 'package:integrations_controller/src/infrastructure/entities_service.dart';
import 'package:integrations_controller/src/infrastructure/vendors_connector_conjecture.dart';

/// Creating a common front out side of integrations controller.
/// Also makes sure to notify the services for changes that relayed to each other
class IcSynchronizer {
  factory IcSynchronizer() => _instance;

  IcSynchronizer._singletonConstractor();

  static final IcSynchronizer _instance =
      IcSynchronizer._singletonConstractor();

  // Networks are beiseparatelyng loaded separately before calling this function
  Future loadAllFromDb() async {
    final String? homeId = NetworksManager().currentNetwork?.uniqueId;
    if (homeId == null) {
      return;
    }
    _loadAreasFromDb(homeId);
    await _loadEntitiesFromDb(homeId);
    _loadAutomationsFromDb(homeId);
  }

  //  -------------------- EntitiesService --------------------

  /// Stream of devices that got discovered or state of device got changed.
  /// from Vendor Connector Conjectore side (or nodeRED for the hub),
  /// this stream dose not include
  /// request for changes from the app!.
  StreamController<MapEntry<String, DeviceEntityBase>> entitiesChangesStream =
      StreamController<MapEntry<String, DeviceEntityBase>>.broadcast();

  Future setEntitiesState(RequestActionObject action) async =>
      EntitiesService().setEntitiesState(action);

  Future<HashMap<String, DeviceEntityBase>> getEntities() async =>
      EntitiesService().getEntities();

  Future _loadEntitiesFromDb(String homeId) =>
      EntitiesService().loadFromDb(homeId);

  Future loginVendor(VendorLoginEntity value) async =>
      VendorsConnectorConjecture().loginVendor(value);

  List<VendorEntityInformation> getVendors() =>
      VendorsConnectorConjecture().getVendors();

  static HashMap<String, EntityTypes> getTypesForEntities(
    HashSet<String> entities,
  ) =>
      VendorsConnectorConjecture().getTypesForEntities(entities);

  //  -------------------- IAreaRepository --------------------

  /// Each time area get changed it will be sent here, could be new area got created
  /// or a new entity got added or deleted from it
  StreamController<MapEntry<String, AreaEntity>> areasChangesStream =
      StreamController<MapEntry<String, AreaEntity>>.broadcast();

  void newEntity(HashMap<String, DeviceEntityBase> entities) {
    for (final MapEntry<String, DeviceEntityBase> entry in entities.entries) {
      entitiesChangesStream.add(entry);
    }
    IAreaRepository.instance
        .addEntitiesToDiscoverdArea(HashSet.from(entities.keys));
  }

  Future<HashMap<String, AreaEntity>> getAreas() =>
      IAreaRepository.instance.getAreas();

  void _loadAreasFromDb(String homeId) =>
      IAreaRepository.instance.loadFromDb(homeId);

  Future setNewArea(AreaEntity area) =>
      IAreaRepository.instance.setNewArea(area);

  Future setEtitiesToArea(String area, HashSet<String> entities) =>
      IAreaRepository.instance.setEtitiesToArea(area, entities);

  //  ------------------ AutomationService --------------------
  HashMap<String, SceneCbjEntity> getScenes() =>
      AutomationService().getScenes();

  Future addScene(SceneCbjEntity scene) async {
    IAreaRepository.instance.addSceneToDiscover(scene.uniqueId.getOrCrash());
    AutomationService().addScene(scene);
  }

  void _loadAutomationsFromDb(String homeId) =>
      AutomationService().loadFromDb(homeId);

  Future activateScene(String id) => AutomationService().activateScene(id);

  Future<HashSet<String>> createPresetScenesForAreaPurposes(
    Set<AreaPurposesTypes> areaPurposes,
  ) =>
      AutomationService().createPresetScenesForAreaPurposes(areaPurposes);

  Future addEntitiesToAutomaticScene({
    required String sceneId,
    required Set<String> entitiesId,
  }) async =>
      AutomationService().addEntitiesToAutomaticScene(
        entities: entitiesId,
        sceneId: sceneId,
      );

  Future deleteEntitiesFromAutomaticScene({
    required String sceneId,
    required Set<String> entitiesId,
  }) async =>
      AutomationService().deleteEntitiesFromAutomaticScene(
        entities: entitiesId,
        sceneId: sceneId,
      );
}
