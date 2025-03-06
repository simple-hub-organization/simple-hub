import 'dart:async';

import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_smart_device/application/usecases/smart_server_u/smart_server_u.dart';
import 'package:cbj_smart_device/utils.dart';
import 'package:grpc/grpc.dart';

class SmartDeviceClient {
  ClientChannel? channel;
  CbjSmartDeviceConnectionsClient? stub;

  Future dispose() async {
    await channel?.shutdown();
    await channel?.terminate();
  }

  Future createStreamWithSmartDevice(
    String addressToHub,
    int hubPort,
  ) async {
    await channel?.terminate();

    channel = await _createCbjSmartDeviceClient(addressToHub, hubPort);
    channel!.onConnectionStateChanged.listen((event) {
      logger.i('gRPC connection state $event');
    });
    stub = CbjSmartDeviceConnectionsClient(channel!);
    ResponseStream<CbjRequestsAndStatusFromHub> response;

    try {
      response = stub!.registerClient(
        ClientRequestsToSmartDeviceServer.steam.stream,
      );

      ClientRequestsToSmartDeviceServer.steam.sink.add(
          CbjClientStatusRequests(allRemoteCommands: CbjAllRemoteCommands()));

      SmartDeviceServerRequestsToSmartDeviceClient.steam.sink
          .addStream(response);
    } catch (e) {
      logger.e('Caught error while stream with hub\n$e');
      await channel?.shutdown();
    }
  }

  Future<ClientChannel> _createCbjSmartDeviceClient(
    String deviceIp,
    int hubPort,
  ) async {
    await channel?.shutdown();
    return ClientChannel(
      deviceIp,
      port: hubPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }
}
