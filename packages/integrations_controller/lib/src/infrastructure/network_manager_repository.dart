part of 'package:integrations_controller/src/domain/networks_manager.dart';

class _NetworkManagerRepository extends NetworksManager {
  final HashMap<String, NetworkObject> _networks = HashMap();
  NetworkObject? _currentNetwork;

  @override
  void addNetwork(NetworkObject network) {
    if (!_networks.containsKey(network.uniqueId)) {
      if (!saveToDb(network)) {
        return;
      }
      _networks.addEntries([MapEntry(network.uniqueId, network)]);
    }
  }

  @override
  NetworkObject? get currentNetwork => _currentNetwork;

  @override
  void setCurrentNetwork(String uniqueId) {
    _currentNetwork = _networks[uniqueId];
  }

  @override
  bool saveToDb(NetworkObject network) {
    IDbRepository.instance
        .createNewHome(network.uniqueId, network.toJsonString());

    return true;
  }

  @override
  void loadFromDb() {
    final List<String> networksString = IDbRepository.instance.getNetworks();
    for (final String networkString in networksString) {
      final NetworkObject network = NetworkObject.fromJsonString(networkString);
      _networks.addEntries([MapEntry(network.uniqueId, network)]);
    }
  }
}
