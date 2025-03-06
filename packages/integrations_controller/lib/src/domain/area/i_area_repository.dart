import 'dart:collection';
import 'dart:convert';

import 'package:integrations_controller/integrations_controller.dart';
import 'package:integrations_controller/src/infrastructure/core/utils.dart';

part 'package:integrations_controller/src/infrastructure/area/area_repository.dart';

abstract class IAreaRepository {
  static IAreaRepository? _instance;

  static IAreaRepository get instance => _instance ??= _AreaRepository();

  Future<HashMap<String, AreaEntity>> getAreas();

  Future setNewArea(AreaEntity area);

  Future setEtitiesToArea(String area, HashSet<String> entities);

  Future addEntitiesToDiscoverdArea(
    HashSet<String> entitiesId, {
    bool synchronizer = true,
  });

  Future onAreasUpdated(HashSet<String> areasId);

  bool saveAreasToDb();

  void loadFromDb(String homeId);

  void addSceneToDiscover(String id);
}
