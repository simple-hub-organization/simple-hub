import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:remote_pipes_router/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:remote_pipes_router/utils.dart';

/// Functions to create Remote Pipes clients for the app and for the hub
class RemotePipesClient {
  /// Create a hub stream with the Remote Pipes
  static Future<void> createHubStreamWithRemotePipes(
    String addressToHub,
    int hubPort,
    StreamController<ClientStatusRequests> clientRequestsController,
    StreamController<RequestsAndStatusFromHub> hubRequestsController,
  ) async {
    ClientChannel? channel;
    CbjHubClient? stub;

    channel = await _createCbjHubClient(addressToHub, hubPort, channel);
    stub = CbjHubClient(channel);

    ResponseStream<ClientStatusRequests> response;

    try {
      /// Transfer all requests from hub to the remote pipes->app
      response = stub.hubTransferDevices(hubRequestsController.stream);

      /// All responses from the app->remote pipes going int the hub
      clientRequestsController.addStream(response);
    } catch (e) {
      logger.e('Caught error: $e');
      await channel.shutdown();
    }
  }

  /// Create a client stream with the Remote Pipes
  static Future<void> createClientStreamWithRemotePipes(
    String addressToHub,
    int hubPort,
    StreamController<RequestsAndStatusFromHub> hubRequestsController,
    StreamController<ClientStatusRequests> clientRequestsController,
  ) async {
    ClientChannel? channel;
    CbjHubClient? stub;

    channel = await _createCbjHubClient(addressToHub, hubPort, channel);
    stub = CbjHubClient(channel);

    ResponseStream<RequestsAndStatusFromHub> response;

    try {
      /// Transfer all requests from client to the remote pipes->app
      response = stub.clientTransferDevices(clientRequestsController.stream);

      /// All responses from the hub->remote pipes going int the client
      hubRequestsController.addStream(response);
    } catch (e) {
      logger.e('Caught error: $e');
      await channel.shutdown();
    }
  }

  static Future<ClientChannel> _createCbjHubClient(
    String deviceIp,
    int hubPort,
    ClientChannel? channel,
  ) async {
    await channel?.shutdown();
    return ClientChannel(
      deviceIp,
      port: hubPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }
}
