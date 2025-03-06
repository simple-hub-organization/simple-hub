import 'dart:async';

// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/infrastructure/core/logger.dart';
import 'package:grpc/grpc.dart';

/// The implantation of the CyBear Jinni App Server from grpc
class _CBJAppServerD extends CyBearJinniAppServiceBase {
  _CBJAppServerD(this.cbjCommendStatus);

  StreamController<CompInfoSB> cbjCommendStatus;

  @override
  Future<CBJCommendStatus> cBJAppGetSmartDeviceInformation(
    ServiceCall call,
    CompInfoSB request,
  ) {
    cbjCommendStatus.add(request);

    return Future<CBJCommendStatus>.value(CBJCommendStatus()..success = true);
  }

  @override
  Future<CompAppInfo> getCompAppInfo(ServiceCall call, CompAppInfo request) {
    return Future<CompAppInfo>.value(CompAppInfo());
  }

//   Future cBJAppGetSmartDeviceInformationAsync(
//       SmartDeviceInfo smartDevice) async {
//     final String smartDeviceIp = smartDevice.smartDeviceIP;
//
//     AddNewCBJDevices.newDevicesStringList.add(smartDeviceIp);
//     logger.t('Smart device IP is $smartDeviceIp');
//
//
//     if (!AddNewCBJDevices.newDevicesList
//         .any((SmartDeviceObject element) => element.ip == smartDeviceIp))
//       AddNewCBJDevices.newDevicesList
//           .addAll(await getAllDevices(smartDeviceIp));
//   }
}

/// Helper class to control the Server
class CreateTheCBJAppServer {
  factory CreateTheCBJAppServer() {
    return _instance;
  }

  CreateTheCBJAppServer._singletonConstructor();

  static final CreateTheCBJAppServer _instance =
      CreateTheCBJAppServer._singletonConstructor();

  Server? server;

  ///  This function will create the server
  Future createServer(StreamController<CompInfoSB> compInfoStream) async {
    await server?.shutdown();
    server = Server.create(services: [_CBJAppServerD(compInfoStream)]);
    await server!.serve(port: 30055);
    logger.i('App server listening on port ${server!.port}...');
  }

  Future shutdownServer() async {
    await server?.shutdown();
    return;
  }
}
