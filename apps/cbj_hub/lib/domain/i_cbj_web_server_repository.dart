part 'package:cbj_hub/infrastructure/cbj_web_server_repository.dart';

/// A cbj web server to interact with get current state requests from mqtt as
/// well as website to change devices state locally on the network without
/// the need of installing any app.
abstract class ICbjWebServerRepository {
  static ICbjWebServerRepository? _instance;

  static ICbjWebServerRepository get instance {
    return _instance ??= _CbjWebServerRepository();
  }

  /// Start the web server
  Future startWebServer();

  /// Get device state
  void getDeviceState(String id) {}
}
