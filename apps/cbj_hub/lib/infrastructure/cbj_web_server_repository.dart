part of 'package:cbj_hub/domain/i_cbj_web_server_repository.dart';

/// A cbj web server to interact with get current state requests from mqtt as
/// well as website to change devices state locally on the network without
/// the need of installing any app.
class _CbjWebServerRepository extends ICbjWebServerRepository {
  _CbjWebServerRepository() {
    startWebServer();
  }

  int portNumber = 5058;

  @override
  Future startWebServer() async {
    // HttpServer.bind('127.0.0.1', portNumber).then((HttpServer server) {
    //   server.listen((HttpRequest request) async {
    //     final List<String> pathArgs = request.uri.pathSegments;
    //     if (pathArgs.length >= 3) {
    //       if (pathArgs[0] == 'Devices') {
    //         final String entityId = pathArgs[1];
    //       } else {
    //         logger.w('pathArgs[0] is not supported ${pathArgs[0]}');
    //         request.response.write('null');
    //       }
    //     } else {
    //       logger.w('pathArgs.length  is lower that 3 ${pathArgs.length}');
    //     }
    //     request.response.close();
    //   });
    // });
    return;
  }

  /// Get device state
  @override
  void getDeviceState(String id) {}
}
