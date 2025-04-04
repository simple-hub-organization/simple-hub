import 'dart:async';
import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:remote_pipes_router/infrastructure/gen/cbj_hub_server/proto_gen_date.dart';
import 'package:remote_pipes_router/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:remote_pipes_router/infrastructure/hub_client/remote_pipes_client.dart';
import 'package:remote_pipes_router/utils.dart';

/// This class get what to execute straight from the grpc request,
class SmartServerU extends CbjHubServiceBase {
  @override
  Stream<RequestsAndStatusFromHub> clientTransferDevices(
    ServiceCall call,
    Stream<ClientStatusRequests> request,
  ) async* {
    logger.v('RegisterClient have been called');

    final Map<String, String>? metadata = call.clientMetadata;
    final String fullUrl = metadata![':authority']!;

    String? domainName;

    if (fullUrl.contains('http')) {
      domainName = fullUrl.substring(fullUrl.indexOf('//') + 2, fullUrl.length);
    } else {
      domainName = fullUrl;
    }

    if (domainName.contains(':')) {
      domainName = domainName.substring(0, domainName.indexOf(':'));
    } else if (domainName.contains('\\')) {
      domainName = domainName.substring(0, domainName.indexOf('\\'));
    } else {
      logger.e('Error in the url processing of $domainName');
      return;
    }

    if (domainName.contains('.')) {
      domainName = domainName.substring(0, domainName.lastIndexOf('.'));
    }

    if (domainName.contains('.')) {
      domainName = domainName.substring(0, domainName.lastIndexOf('.'));
    }

    logger.w('Client FullUrl name is $fullUrl');
    logger.w('Client Domain name is $domainName');

    try {
      final StreamController<ClientStatusRequests> clientRequests =
          StreamController<ClientStatusRequests>();

      clientRequests.addStream(request);

      final StreamController<RequestsAndStatusFromHub> hubRequests =
          StreamController<RequestsAndStatusFromHub>();
      RemotePipesClient.createClientStreamWithRemotePipes(
        domainName,
        50051,
        hubRequests,
        clientRequests,
      );

      yield* hubRequests.stream;
      //     .handleError((error) {
      //   if (error is GrpcError && error.code == 1) {
      //     logger.v('Client have disconnected');
      //   } else {
      //     logger.e('Client stream error: $error');
      //   }
      // });
    } catch (e) {
      logger.e('Client Client error\n$e');
    }
  }

  @override
  Stream<ClientStatusRequests> hubTransferDevices(
    ServiceCall call,
    Stream<RequestsAndStatusFromHub> request,
  ) async* {
    logger.v('RegisterHub have been called');

    final Map<String, String>? a = call.clientMetadata;
    final String fullUrl = a![':authority']!;

    String? domainName;

    if (fullUrl.contains('http')) {
      domainName = fullUrl.substring(fullUrl.indexOf('//') + 2, fullUrl.length);
    } else {
      domainName = fullUrl;
    }

    if (domainName.contains(':')) {
      domainName = domainName.substring(0, domainName.indexOf(':'));
    } else if (domainName.contains('\\')) {
      domainName = domainName.substring(0, domainName.indexOf('\\'));
    } else {
      logger.e('Error in the url processing of $domainName');
      return;
    }

    if (domainName.contains('.')) {
      domainName = domainName.substring(0, domainName.lastIndexOf('.'));
    }

    if (domainName.contains('.')) {
      domainName = domainName.substring(0, domainName.lastIndexOf('.'));
    }

    logger.w('Hub fullUrl name is $fullUrl');
    logger.w('Hub domain name is $domainName');

    try {
      final StreamController<RequestsAndStatusFromHub> hubRequests =
          StreamController<RequestsAndStatusFromHub>();
      hubRequests.addStream(request);

      final StreamController<ClientStatusRequests> clientRequests =
          StreamController<ClientStatusRequests>();

      RemotePipesClient.createHubStreamWithRemotePipes(
        domainName,
        50051,
        clientRequests,
        hubRequests,
      );

      yield* clientRequests.stream;
      //     .handleError((error) {
      //   if (error is GrpcError && error.code == 1) {
      //     logger.v('Hub have disconnected');
      //   } else {
      //     logger.e('Hub stream error: $error');
      //   }
      // });
    } catch (e) {
      logger.e('Register Hub error\n$e');
    }
  }

  ///  Listening to port and deciding what to do with the response
  void waitForConnection() {
    logger.v('Wait for connection');

    final SmartServerU smartServer = SmartServerU();
    smartServer.startListen(); // Will go throw the model with the
    // grpc logic and converter to objects
  }

  ///  Listening in the background to incoming connections
  Future<void> startListen() async {
    await startLocalServer();
  }

  /// Starting the local server that listen to hub and app calls
  Future startLocalServer() async {
    try {
      final server = Server.create(services: [SmartServerU()]);
      await server.serve(port: 50056);
      logger.v('Server listening on port ${server.port}...');
    } catch (e) {
      logger.e('Server error $e');
    }
  }

  @override
  Future<CompHubInfo> getCompHubInfo(
    ServiceCall call,
    CompHubInfo request,
  ) async {
    logger.i('Hub info got requested');

    final CbjHubIno cbjHubIno = CbjHubIno(
      deviceName: 'cbj Remote Pipes Routing',
      protoLastGenDate: hubServerProtocGenDate,
      dartSdkVersion: Platform.version,
    );

    final CompHubSpecs compHubSpecs = CompHubSpecs(
      compOs: Platform.operatingSystem,
    );

    final CompHubInfo compHubInfo = CompHubInfo(
      cbjInfo: cbjHubIno,
      compSpecs: compHubSpecs,
    );
    return compHubInfo;
  }
}
