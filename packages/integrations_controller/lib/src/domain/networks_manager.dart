import 'dart:collection';

import 'package:integrations_controller/src/domain/i_local_db_repository.dart';
import 'package:integrations_controller/src/domain/network_object.dart';

class NetworksManager {
  factory NetworksManager() => _instance;

  NetworksManager._singletonConstractor();

  static final NetworksManager _instance =
      NetworksManager._singletonConstractor();

  final HashMap<String, NetworkObject> _networks = HashMap();
  NetworkObject? currentNetwork;

  void addNetwork(NetworkObject network) {
    if (!_networks.containsKey(network.uniqueId)) {
      if (!saveToDb(network)) {
        return;
      }
      _networks.addEntries([MapEntry(network.uniqueId, network)]);
    }
  }

  void setCurrentNetwork(String uniqueId) {
    currentNetwork = _networks[uniqueId];
  }

  bool saveToDb(NetworkObject network) {
    IDbRepository.instance
        .createNewHome(network.uniqueId, network.toJsonString());

    return true;
  }

  void loadFromDb() {
    final List<String> networksString = IDbRepository.instance.getNetworks();
    for (final String networkString in networksString) {
      final NetworkObject network = NetworkObject.fromJsonString(networkString);
      _networks.addEntries([MapEntry(network.uniqueId, network)]);
    }
  }
}
