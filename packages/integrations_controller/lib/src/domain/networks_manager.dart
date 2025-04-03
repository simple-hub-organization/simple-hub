import 'dart:collection';

import 'package:integrations_controller/src/domain/i_local_db_repository.dart';
import 'package:integrations_controller/src/domain/network_object.dart';

part 'package:integrations_controller/src/infrastructure/network_manager_repository.dart';

abstract class NetworksManager {
  static NetworksManager? _instance;

  static NetworksManager get instance =>
      _instance ??= _NetworkManagerRepository();

  static set instance(NetworksManager value) => _instance = value;

  void addNetwork(NetworkObject network);

  NetworkObject? get currentNetwork;

  void setCurrentNetwork(String uniqueId);

  bool saveToDb(NetworkObject network);

  void loadFromDb();
}
