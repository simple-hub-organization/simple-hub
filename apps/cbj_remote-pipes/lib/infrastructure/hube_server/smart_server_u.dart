import 'dart:async';
import 'dart:io';

import 'package:cbj_remote_pipes/domain/piping_macanisem/combin_streams.dart';
import 'package:cbj_remote_pipes/infrastructure/gen/cbj_hub_server/proto_gen_date.dart';
import 'package:cbj_remote_pipes/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_remote_pipes/utils.dart';
import 'package:grpc/grpc.dart';

/// This class get what to execute straight from the grpc request,
class SmartServerU extends CbjHubServiceBase {
  @override
  Stream<RequestsAndStatusFromHub> clientTransferDevices(
    ServiceCall call,
    Stream<ClientStatusRequests> request,
  ) async* {
    logger.v('RegisterClient have been called');
    try {
      PipItDown.clientsGroup.add(request);
      yield* PipItDown.hubsGroup.stream.handleError((error) {
        if (error is GrpcError && error.code == 1) {
          logger.v('Hub have disconnected\n$error');
        } else {
          logger.e('Hub stream error\n$error');
        }
      });
    } catch (e) {
      logger.e('Register client error\n$e');
    }
  }

  @override
  Stream<ClientStatusRequests> hubTransferDevices(
    ServiceCall call,
    Stream<RequestsAndStatusFromHub> request,
  ) async* {
    logger.v('RegisterHub have been called');

    try {
      PipItDown.hubsGroup.add(request);
      yield* PipItDown.clientsGroup.stream.handleError((error) {
        if (error is GrpcError && error.code == 1) {
          logger.v('Client have disconnected\n$error');
        } else {
          logger.e('Client stream error\n$error');
        }
      });
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
  // TODO change local server port based on env
  Future startLocalServer() async {
    try {
      final server = Server([SmartServerU()]);
      await server.serve(port: 50051);
      logger.v('Server listening on port ${server.port}...');
    } catch (e) {
      logger.e('Server error\n$e');
    }
  }

  @override
  Future<CompHubInfo> getCompHubInfo(
    ServiceCall call,
    CompHubInfo request,
  ) async {
    logger.i('Hub info got requested');

    final CbjHubIno cbjHubIno = CbjHubIno(
      deviceName: 'cbj Remote Pipes',
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
