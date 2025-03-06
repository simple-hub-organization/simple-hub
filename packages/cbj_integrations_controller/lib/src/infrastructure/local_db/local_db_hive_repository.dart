part of 'package:cbj_integrations_controller/src/domain/i_local_db_repository.dart';

class _HiveRepository extends IDbRepository {
  _HiveRepository() {
    Hive.registerAdapter(HomeHiveModelAdapter());
  }
  @override
  Future asyncConstructor() async {
    homeBox = await Hive.openBox(homesBoxName);
  }

  final String homesBoxName = 'homes';
  late Box<HomeHiveModel> homeBox;

  @override
  List<String> getNetworks() => homeBox.values.map((e) => e.network).toList();

  /// When finding a new network
  @override
  void createNewHome(String homeBoxName, String networkString) {
    final HomeHiveModel homeModelNew = HomeHiveModel()
      ..uniqueId = homeBoxName
      ..name = homeBoxName
      ..areas = []
      ..entities = []
      ..scenes = []
      ..routines = []
      ..bindings = []
      ..mostUsedBy = []
      ..permissions = []
      ..types = []
      ..background = '#f5ff'
      ..network = networkString;
    homeBox.put(homeBoxName, homeModelNew);
  }

  @override
  void saveEntities(String homeBoxName, List<String> value) {
    final HomeHiveModel? homeModel = homeBox.get(homeBoxName);
    if (homeModel == null) {
      return;
    }
    homeModel.entities = value;
    homeBox.put(homeBoxName, homeModel);
  }

  @override
  void saveAreas(String homeBoxName, List<String> value) {
    final HomeHiveModel? homeModel = homeBox.get(homeBoxName);
    if (homeModel == null) {
      return;
    }
    homeModel.areas = value;
    homeBox.put(homeBoxName, homeModel);
  }

  @override
  void saveScenes(String homeBoxName, List<String> value) {
    final HomeHiveModel? homeModel = homeBox.get(homeBoxName);
    if (homeModel == null) {
      return;
    }
    homeModel.scenes = value;
    homeBox.put(homeBoxName, homeModel);
  }

  @override
  List<String> getAreas(String homeId) => homeBox.get(homeId)?.areas ?? [];

  @override
  List<String> getEntities(String homeId) =>
      homeBox.get(homeId)?.entities ?? [];

  @override
  List<String> getScenes(String homeId) => homeBox.get(homeId)?.scenes ?? [];
}
