part of 'package:simple_hub/domain/connections_service.dart';

class _AppConnectionService implements ConnectionsService {
  _AppConnectionService(this.networkBssid);

  String networkBssid;
  SearchDevices? searchDevicesInstance;

  @override
  Future<HashMap<String, DeviceEntityBase>> get getEntities =>
      IcSynchronizer().getEntities();

  @override
  Future<HashMap<String, AreaEntity>> get getAreas =>
      IcSynchronizer().getAreas();

  @override
  Future<Either<HubFailures, Unit>> searchDevices() async {
    searchDevicesInstance = (searchDevicesInstance ?? SearchDevices())
      ..startSearchIsolate(
        networkUtilitiesType: NetworkUtilitiesFlutter(),
        systemCommands: SystemCommandsBaseClassD.instance,
      );
    return right(unit);
  }

  @override
  Stream<MapEntry<String, DeviceEntityBase>> watchEntities() =>
      IcSynchronizer().entitiesChangesStream.stream;

  @override
  Stream<MapEntry<String, AreaEntity>> watchAreas() =>
      IcSynchronizer().areasChangesStream.stream;

  @override
  void setEntityState(RequestActionObject action) =>
      IcSynchronizer().setEntitiesState(action);

  @override
  Future dispose() async => searchDevicesInstance?.dispose();

  @override
  Future setNewArea(AreaEntity area) async {
    IcSynchronizer().setNewArea(area);
  }

  @override
  Future setEntitiesToArea(String areaId, HashSet<String> entities) =>
      IcSynchronizer().setEtitiesToArea(areaId, entities);

  @override
  Future<HashMap<String, SceneEntity>> get getScenes async =>
      IcSynchronizer().getScenes();

  @override
  Future activateScene(String id) => IcSynchronizer().activateScene(id);

  @override
  Future addScene(SceneEntity scene) => IcSynchronizer().addScene(scene);

  @override
  Future loginVendor(VendorLoginEntity value) =>
      IcSynchronizer().loginVendor(value);

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
