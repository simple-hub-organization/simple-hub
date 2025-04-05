// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';

class TestNetworkManagerRepository extends NetworksManager {
  TestNetworkManagerRepository() {
    NetworksManager.instance = this;
  }

  @override
  void addNetwork(NetworkObject network) {}

  @override
  NetworkObject? get currentNetwork => NetworkObject(
        ssid: 'ssid',
        bssid: 'bssid',
        subNet: 'subNet',
        longitude: null,
        latitude: null,
        type: null,
        remotePipe: null,
      );

  @override
  void loadFromDb() {}

  @override
  bool saveToDb(NetworkObject network) => true;

  @override
  void setCurrentNetwork(String uniqueId) {}
}
