import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:grpc/grpc.dart';
import 'package:hub/infrastructure/core/injection.dart';
import 'package:hub/infrastructure/core/requests_helper.dart';
import 'package:hub/infrastructure/hub_server/hub_server.dart';
import 'package:hub/utils.dart';
import 'package:integrations_controller/integrations_controller.dart';
import 'package:mqtt_client/mqtt_client.dart';

part 'package:hub/infrastructure/hub_server/hub_server_controller.dart';

abstract class IHubServerController {
  static IHubServerController? _instance;

  static IHubServerController get instance {
    return _instance ??= _HubServerController();
  }

  Future getFromApp({
    required Stream<ClientStatusRequests> request,
    required String requestUrl,
  });

  Future sendAllAreasFromHubRequestsStream();
  Future sendAllEntitiesFromHubRequestsStream();
  Future sendAllScenesFromHubRequestsStream();

  Future sendAllEntities();
  Future sendAllAreas();
  Future sendAllScenes();
  Future sendAllVendors();
}
