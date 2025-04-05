import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';
import 'package:grpc/service_api.dart';
import 'package:hub/domain/i_hub_server_controller.dart';
import 'package:hub/utils.dart';
import 'package:integrations_controller/integrations_controller.dart';
import 'package:rxdart/rxdart.dart';

/// Server to get and send information to the app
class HubAppServer extends CbjHubServiceBase {
  @override
  Stream<RequestsAndStatusFromHub> clientTransferEntities(
    ServiceCall call,
    Stream<ClientStatusRequests> request,
  ) async* {
    try {
      logger.t('Got new Client');

      IHubServerController.instance.getFromApp(
        request: request,
        requestUrl: 'Error, Hub does not suppose to have request URL',
      );

      yield* HubRequestsToApp.stream
          .handleError((error) => logger.e('Stream have error $error'));
    } catch (e) {
      logger.e('Hub server error $e');
    }
  }

  @override
  Future<CompHubInfo> getCompHubInfo(
    ServiceCall call,
    CompHubInfo request,
  ) async {
    logger.i('Hub info got requested');

    final CbjHubIno cbjHubIno = CbjHubIno(
      entityName: 'cbj Hub',
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

  @override
  Stream<ClientStatusRequests> hubTransferEntities(
    ServiceCall call,
    Stream<RequestsAndStatusFromHub> request,
  ) async* {
    /// Not in use here, remote pipes comunication with hub use this function
  }
}

/// Requests and updates from hub to the app
class HubRequestsToApp {
  static BehaviorSubject<RequestsAndStatusFromHub> stream =
      BehaviorSubject<RequestsAndStatusFromHub>();
}

/// App requests for the hub to execute
class AppRequestsToHub {
  /// Stream controller of the app request for the hub

  static StreamGroup<ClientStatusRequests> appRequestsToHubStreamBroadcast =
      StreamGroup.broadcast();

  static bool boolListenWorking = false;

  static final appRequestsToHubStreamController =
      StreamController<ClientStatusRequests>();

  static Future listenToApp() async {
    if (boolListenWorking) {
      return;
    }
    boolListenWorking = true;
    appRequestsToHubStreamBroadcast
        .add(appRequestsToHubStreamController.stream);
  }
}
