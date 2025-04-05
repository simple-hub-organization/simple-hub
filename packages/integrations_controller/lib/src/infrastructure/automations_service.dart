import 'dart:collection';
import 'dart:convert';

import 'package:integrations_controller/integrations_controller.dart';
import 'package:integrations_controller/src/infrastructure/scenes/area_types_scientific_presets/area_type_with_device_type_preset.dart';

class AutomationService {
  factory AutomationService() => _instance;

  AutomationService._singletonConstructor();

  static final AutomationService _instance =
      AutomationService._singletonConstructor();

  /// {SceneId, SceneEntity}
  final HashMap<String, SceneEntity> _scenes = HashMap();

  HashMap<String, SceneEntity> getScenes() => _scenes;

  void addScene(SceneEntity scene) {
    _scenes.addEntries([MapEntry(scene.uniqueId.getOrCrash(), scene)]);
    saveScenesToDb();
  }

  void loadFromDb(String homeId) {
    loadScenesFromDb(homeId);
  }

  void loadScenesFromDb(String homeId) {
    final List<String> scenesString = IDbRepository.instance.getScenes(homeId);
    for (final String sceneString in scenesString) {
      final SceneEntity scene = SceneDtos.fromJson(
        jsonDecode(sceneString) as Map<String, dynamic>,
      ).toDomain();
      _scenes.addEntries([MapEntry(scene.uniqueId.getOrCrash(), scene)]);
    }
  }

  void saveScenesToDb() {
    final List<String> automationsJsonString = [];

    for (final SceneEntity scene in _scenes.values) {
      final String sceneAsJsonString =
          jsonEncode(scene.toInfrastructure().toJson());
      automationsJsonString.add(sceneAsJsonString);
    }
    final String homeBoxName =
        NetworksManager.instance.currentNetwork!.uniqueId;

    IDbRepository.instance.saveScenes(homeBoxName, automationsJsonString);
  }

  Future activateScene(String id) async {
    final SceneEntity? scene = _scenes[id];
    if (scene == null) {
      return;
    }

    final HashSet<String> entitiesId =
        HashSet.from(scene.actions.map((e) => e.entityIds.first));
    entitiesId.addAll(scene.entitiesWithAutomaticPurpose.getOrCrash());
    final List<RequestActionObject> tempActions = scene.actions;
    tempActions.addAll(
      getPresetsForEntities(
        scene.entitiesWithAutomaticPurpose.getOrCrash(),
        scene.areaPurposeType,
      ),
    );

    for (final String entityId in entitiesId) {
      final List<RequestActionObject> actionsForEntity = tempActions
          .where((element) => element.entityIds.contains(entityId))
          .toList();
      activeAutomationsForEntity(actionsForEntity);
    }
  }

  Future activeAutomationsForEntity(List<RequestActionObject> actions) async {
    for (final RequestActionObject action in actions) {
      if (action.property == EntityProperties.delay) {
        final dynamic duration = action.value[ActionValues.duration];
        if (duration != null && duration is Duration) {
          await Future.delayed(duration);
        }
        continue;
      }
      IcSynchronizer().setEntitiesState(action);
    }
  }

  void addEntitiesToAutomaticScene({
    required String sceneId,
    required Set<String> entities,
  }) {
    final SceneEntity? sceneCopy = _scenes[sceneId];

    if (sceneCopy == null) {
      return;
    }

    final HashSet<String> allInAutomatic =
        sceneCopy.entitiesWithAutomaticPurpose.getOrCrash();
    allInAutomatic.addAll(entities);
    _scenes[sceneId] = sceneCopy.copyWith(
      entitiesWithAutomaticPurpose:
          EntitiesWithAutomaticPurpose(allInAutomatic),
    );
    saveScenesToDb();
  }

  void deleteEntitiesFromAutomaticScene({
    required String sceneId,
    required Set<String> entities,
  }) {
    final SceneEntity? sceneCopy = _scenes[sceneId];

    if (sceneCopy == null) {
      return;
    }

    final HashSet<String> allInAutomatic =
        sceneCopy.entitiesWithAutomaticPurpose.getOrCrash();
    allInAutomatic.removeAll(entities);
    _scenes[sceneId] = sceneCopy.copyWith(
      entitiesWithAutomaticPurpose:
          EntitiesWithAutomaticPurpose(allInAutomatic),
    );
    saveScenesToDb();
  }

  Future<HashSet<String>> createPresetScenesForAreaPurposes(
    Set<AreaPurposesTypes> areaPurposes,
  ) async {
    final HashSet<String> scenesId = HashSet();
    for (final AreaPurposesTypes purposesType in areaPurposes) {
      final SceneEntity scene = SceneEntity(
        uniqueId: UniqueId(),
        name: SceneCbjName(purposesType.name),
        backgroundColor: SceneCbjBackgroundColor('#985dc7'),
        nodeRedFlowId: SceneCbjNodeRedFlowId(''),
        firstNodeId: SceneCbjFirstNodeId(''),
        iconCodePoint: SceneCbjIconCodePoint(''),
        image: SceneCbjBackgroundImage(''),
        lastDateOfExecute: SceneCbjLastDateOfExecute(''),
        stateMassage: SceneCbjStateMassage(''),
        senderDeviceOs: SceneCbjSenderDeviceOs(''),
        senderDeviceModel: SceneCbjSenderDeviceModel(''),
        senderId: SceneCbjSenderId(''),
        compUuid: SceneCbjCompUuid(''),
        entityStateGRPC: SceneCbjDeviceStateGRPC(EntityStateGRPC.ack.name),
        actions: [],
        areaPurposeType: purposesType,
        entitiesWithAutomaticPurpose: EntitiesWithAutomaticPurpose(HashSet()),
      );

      scenesId.add(scene.uniqueId.getOrCrash());
      addScene(scene);
    }
    return scenesId;
  }

  List<RequestActionObject> getPresetsForEntities(
    HashSet<String> entities,
    AreaPurposesTypes areaPurposeType,
  ) {
    final List<RequestActionObject> presets = [];
    final HashMap<String, EntityTypes> entitiesWithType =
        IcSynchronizer.getTypesForEntities(entities);
    for (final MapEntry<String, EntityTypes> entery
        in entitiesWithType.entries) {
      presets.addAll(
        AreaTypeWithEntitiesTypePreset.getPreDefineActionForEntitiesInArea(
          entityId: entery.key,
          entityType: entery.value,
          areaPurposeType: areaPurposeType,
        ),
      );
    }

    return presets;
  }
}
