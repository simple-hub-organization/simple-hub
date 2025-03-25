part of 'package:simple_hub/domain/connections_service.dart';

class _DemoConnectionService implements ConnectionsService {
  _DemoConnectionService(this.networkBssid);

  String networkBssid;

  StreamController<MapEntry<String, DeviceEntityBase>>? entitiesStream;
  StreamController<MapEntry<String, AreaEntity>>? areasStream;

  @override
  Future dispose() async {
    entitiesStream?.close();
  }

  @override
  Future<HashMap<String, DeviceEntityBase>> get getEntities async =>
      DemoConnectionController.getAllEntities();

  @override
  Future<HashMap<String, AreaEntity>> get getAreas async => HashMap();

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
  Future setNewArea(AreaEntity area) async {}

  @override
  Future setEntitiesToArea(String areaId, HashSet entities) async {}

  @override
  Future addScene(SceneEntity scene) async {}

  @override
  Future<HashMap<String, SceneEntity>> get getScenes async => HashMap();

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
  Future requestAreaEntitiesScenes() {
    // TODO: implement findHub
    throw UnimplementedError();
  }
  
  @override
  Stream<MapEntry<String, SceneEntity>> watchScenes() {
    // TODO: implement watchScenes
    throw UnimplementedError();
  }
}
