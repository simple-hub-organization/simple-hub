import 'package:grpc/grpc.dart';
import 'package:security_bear/infrastructure/gen/cbj_app/protoc_as_dart/cbj_app_connections.pbgrpc.dart';
import 'package:security_bear/utils.dart';

/// Class to manage calls to the CBJApp server
class CBJAppClient {
  /// Will Send the IP of this device to server in the connected network
  static Future<bool?> sendMyIPToServer(
    String serverIp,
    String myDeviceIP,
  ) async {
    final ClientChannel channel = createCBJAppClient(serverIp);
    final CyBearJinniAppClient stub = CyBearJinniAppClient(channel);
    CBJCommendStatus responseSBCommendStatus = CBJCommendStatus();

    final CompInfoSB smartDeviceInfo = CompInfoSB()..compIP = myDeviceIP;

    try {
      responseSBCommendStatus =
          await stub.cBJAppGetSmartDeviceInformation(smartDeviceInfo);

      logger.i('Greeter client received: $responseSBCommendStatus');
//      await channel.shutdown();
      return Future.value(responseSBCommendStatus.success);
    } catch (e) {
      logger.e('Caught error: $e');
    }
//    await channel.shutdown();
    return null;
  }

  static ClientChannel createCBJAppClient(String serverIp) {
    return ClientChannel(
      serverIp,
      port: 30055,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }
}
