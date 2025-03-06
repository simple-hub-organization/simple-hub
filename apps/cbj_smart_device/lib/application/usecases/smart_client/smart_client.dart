import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_smart_device/application/usecases/smart_server_u/smart_server_u.dart';
import 'package:cbj_smart_device/utils.dart';
import 'package:grpc/grpc.dart';

class SmartClient {
  static ClientChannel? channel;
  static CbjSmartDeviceConnectionsClient? stub;

  Future dispose() async {
    await channel?.shutdown();
    await channel?.terminate();
  }

  ///  Turn smart device on
  static Future createStreamWithClients(String addressToHub) async {
    channel = await createCbjSmartDeviceServerClient(addressToHub);
    stub = CbjSmartDeviceConnectionsClient(channel!);

    try {
      stub!.registerHub(Stream.value(CbjRequestsAndStatusFromHub()));

// await channel!.shutdown();
// return response.success.toString();
    } catch (e) {
      logger.i('Caught error: $e');
    }
// await channel!.shutdown();
// throw 'Error';
  }

  static Future<ClientChannel> createCbjSmartDeviceServerClient(
    String deviceIp,
  ) async {
    await channel?.shutdown();
    return ClientChannel(
      deviceIp,
      port: CbjSmartDeviceServerU.port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }
}
