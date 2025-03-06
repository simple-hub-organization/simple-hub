import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:hub/infrastructure/core/requests_helper.dart';
import 'package:hub/infrastructure/hub_server/hub_server.dart';
import 'package:hub/utils.dart';
import 'package:integrations_controller/integrations_controller.dart';

// TODO: Replace with HubClient
class RemotePipesClient {
  static ClientChannel? channel;
  static CbjHubClient? stub;

  Future startRemotePipesConnection(String remotePipesDomain) async {
    const int remotePipesPort = 50051;
    RemotePipesClient.createStreamWithHub(
      remotePipesDomain,
      // 'homeservice-one-service.default.g.com',
      remotePipesPort,
    );
    // await Future.delayed(const Duration(minutes: 1));
    // RemotePipesClient.createStreamWithHub(
    //   remotePipesDomain,
    //   // 'homeservice-one-service.default.g.com',
    //   remotePipesPort,
    // );

    // Here for easy find and local testing
    // RemotePipesClient.createStreamWithHub('127.0.0.1', 50056);
    logger.i(
      'Creating connection with remote pipes to the domain $remotePipesDomain'
      ' on port $remotePipesPort',
    );
  }

  Future startRemotePipesWhenThereIsConnectionToWww(
    String remotePipesDomain,
  ) async {
    // int counter = 0;

    // while (true) {
    //   final bool result = await InternetConnectionChecker().hasConnection;
    //   if (result) {
    //     break;
    //   }
    //   if (counter > 5) {
    //     await Future.delayed(const Duration(minutes: 2));
    //   } else {
    //     await Future.delayed(const Duration(seconds: 3));
    //   }
    //   counter++;
    // }
    logger.i('Internet detected, will try to reconnect to Remote Pipes');
    startRemotePipesConnection(remotePipesDomain);
  }

  // createStreamWithRemotePipes
  ///  Turn smart device on
  static Future createStreamWithHub(
    String addressToHub,
    int hubPort,
  ) async {
    channel = await _createCbjHubClient(addressToHub, hubPort);
    stub = CbjHubClient(channel!);

    logger.i('Try remote pipes connection');
    try {
      final ResponseStream<ClientStatusRequests> response =
          stub!.hubTransferEntities(
        /// Transfer all requests from hub to the remote pipes->app
        HubRequestsToApp.stream.handleError((error) {
          logger.e('Stream have error $error');
        }),
      );
      // response.listen((value) {
      //   logger.i('Response to remote pipes $value');
      // });

      /// All responses from the app->remote pipes going int the hub
      RequestsHelper.streamFromApp(
        request: response,
        requestUrl: addressToHub,
      );
    } catch (e) {
      logger.e('Caught error: $e');
      await channel?.terminate();
    }
  }

  static Future<ClientChannel> _createCbjHubClient(
    String deviceIp,
    int hubPort,
  ) async {
    await channel?.terminate();
    return ClientChannel(
      deviceIp,
      port: hubPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }
}
