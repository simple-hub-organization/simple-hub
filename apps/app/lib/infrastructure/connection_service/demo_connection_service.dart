part of 'package:simple_hub/domain/connections_service.dart';

class _DemoConnectionService implements ConnectionsService {
  _DemoConnectionService(this.networkBssid);

  String networkBssid;

  StreamController<MapEntry<String, DeviceEntityBase>>? entitiesStream;
  StreamController<MapEntry<String, AreaEntity>>? areasStream;
  StreamController<MapEntry<String, SceneEntity>>? scenesStream;

  // BehaviorSubject<RequestsAndStatusFromHub> hubMessagesToApp =
  // BehaviorSubject<RequestsAndStatusFromHub>();
  //
  // BehaviorSubject<ClientStatusRequests> appMessagesToHub = BehaviorSubject();

  @override
  Future dispose() async => entitiesStream?.close();

  @override
  Future<HashMap<String, DeviceEntityBase>> get getEntities async =>
      DemoConnectionController.getAllEntities();

  @override
  Future<HashMap<String, AreaEntity>> get getAreas async {
    final HashMap<String, DeviceEntityBase> entities = await getEntities;
    final HashMap<String, SceneEntity> scenes = await getScenes;

    final String emptyAreaId = AreaEntity.empty().uniqueId.getOrCrash();
    final HashMap<String, AreaEntity> areas = HashMap()
      ..addEntries([MapEntry(emptyAreaId, AreaEntity.empty())]);
    areas[emptyAreaId]?.addEntities(HashSet.from(entities.keys));
    areas[emptyAreaId]?.addScenesId(HashSet.from(scenes.keys));
    return areas;
  }

  @override
  Future<HashMap<String, SceneEntity>> get getScenes async => HashMap()
    ..addEntries([
      MapEntry(SceneEntity.empty().uniqueId.getOrCrash(), SceneEntity.empty())
    ]);

  @override
  Future<Either<HubFailures, Unit>> searchDevices() async =>
      left(const HubFailures.unexpected());

  @override
  void setEntityState(RequestActionObject action) {}

  @override
  Stream<MapEntry<String, DeviceEntityBase>> watchEntities() {
    entitiesStream?.close();

    entitiesStream = StreamController.broadcast();
    return entitiesStream!.stream;
  }

  @override
  Stream<MapEntry<String, AreaEntity>> watchAreas() {
    areasStream?.close();

    areasStream = StreamController.broadcast();
    return areasStream!.stream;
  }

  @override
  Stream<MapEntry<String, SceneEntity>> watchScenes() {
    scenesStream?.close();

    scenesStream = StreamController.broadcast();
    return scenesStream!.stream;
  }

  @override
  Future setNewArea(AreaEntity area) async {}

  @override
  Future setEntitiesToArea(String areaId, HashSet entities) async {}

  @override
  Future addScene(SceneEntity scene) async {}

  @override
  Future activateScene(String id) async {}

  @override
  Future loginVendor(VendorLoginEntity value) async {}

  @override
  Future<List<VendorEntityInformation>> getVendors() async =>
      IcSynchronizer().getVendors();

  @override
  Future<bool> connect({String? address}) async => true;

  @override
  Future requestAreaEntitiesScenes() async {
    final HashMap<String, AreaEntity> areas = await getAreas;
    logger.i('areas ${areas.length}');
    for (final MapEntry<String, AreaEntity> area in areas.entries) {
      areasStream?.add(area);
    }

    final HashMap<String, SceneEntity> scenes = await getScenes;
    logger.i('scenes ${scenes.length}');
    for (final MapEntry<String, SceneEntity> scene in scenes.entries) {
      scenesStream?.add(scene);
    }

    final HashMap<String, DeviceEntityBase> entities = await getEntities;
    logger.i('entities ${entities.length}');
    for (final MapEntry<String, DeviceEntityBase> entity in entities.entries) {
      entitiesStream?.add(entity);
    }
  }
}
