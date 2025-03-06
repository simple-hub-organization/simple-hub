part of 'package:simple_hub/domain/connections_service.dart';

class _NoneConnectionService implements ConnectionsService {
  StreamController<MapEntry<String, DeviceEntityBase>>? entitiesStream;
  StreamController<MapEntry<String, AreaEntity>>? areasStream;

  @override
  Future dispose() async {
    entitiesStream?.close();
  }

  @override
  Future<HashMap<String, DeviceEntityBase>> get getEntities async => HashMap();

  @override
  Future<HashMap<String, AreaEntity>> get getAreas async => HashMap();

  @override
  Future searchDevices() async {}

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
  Future<HashMap<String, SceneCbjEntity>> get getScenes async => HashMap();

  @override
  Future addScene(SceneCbjEntity scene) async {}

  @override
  Future activateScene(String id) async {}

  @override
  Future loginVendor(VendorLoginEntity value) async {}

  @override
  Future<List<VendorEntityInformation>> getVendors() async => [];

  @override
  Future<bool> connect({String? address}) async => true;
}
