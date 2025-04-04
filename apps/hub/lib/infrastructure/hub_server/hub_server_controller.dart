part of 'package:hub/domain/i_hub_server_controller.dart';

class _HubServerController extends IHubServerController {
  _HubServerController() {
    if (currentEnv == Env.prod) {
      hubPort = 50055;
    } else {
      hubPort = 60055;
    }
    startLocalServer();
  }

  /// Port to connect to the cbj hub, will change according to the current
  /// running environment
  late int hubPort;

  Future startLocalServer() async {
    final server = Server.create(services: [HubAppServer()]);
    await server.serve(port: hubPort);
    logger.i('Hub Server listening for apps clients on port ${server.port}...');
  }

  void sendToApp(Stream<MqttPublishMessage> dataToSend) {}

  @override
  Future getFromApp({
    required Stream<ClientStatusRequests> request,
    required String requestUrl,
  }) async =>
      RequestsHelper.streamFromApp(request: request, requestUrl: requestUrl);

  /// Trigger to send all areas from hub to app using the
  /// HubRequestsToApp stream
  @override
  Future sendAllAreasFromHubRequestsStream() async {
    final Map<String, AreaEntity> allAreas = await IcSynchronizer().getAreas();

    if (allAreas.isEmpty) {
      logger.w("Can't find areas in the local DB");

      return;
    }
    allAreas.map((String id, AreaEntity d) {
      final RequestsAndStatusFromHub request = RequestsAndStatusFromHub(
        sendingType: SendingType.areaType.name,
        allRemoteCommands: jsonEncode(d.toInfrastructure().toJson()),
      );

      HubRequestsToApp.stream.sink.add(request);
      return MapEntry(id, jsonEncode(d.toInfrastructure().toJson()));
    });
  }

  /// Trigger to send all devices from hub to app using the
  /// HubRequestsToApp stream
  @override
  Future sendAllEntitiesFromHubRequestsStream() async {
    final Map<String, DeviceEntityBase> allDevices =
        await IcSynchronizer().getEntities();

    allDevices.map((String id, DeviceEntityBase d) {
      final RequestsAndStatusFromHub request = RequestsAndStatusFromHub(
        sendingType: SendingType.entityType.name,
        allRemoteCommands: DeviceHelper.convertDomainToJsonString(d),
      );

      HubRequestsToApp.stream.sink.add(request);
      return MapEntry(id, DeviceHelper.convertDomainToJsonString(d));
    });
  }

  /// Trigger to send all scenes from hub to app using the
  /// HubRequestsToApp stream
  @override
  Future sendAllScenesFromHubRequestsStream() async {
    final Map<String, SceneEntity> allScenes = IcSynchronizer().getScenes();

    if (allScenes.isNotEmpty) {
      allScenes.map((String id, SceneEntity d) {
        final RequestsAndStatusFromHub request = RequestsAndStatusFromHub(
          sendingType: SendingType.sceneType.name,
          allRemoteCommands: jsonEncode(d.toInfrastructure().toJson()),
        );
        HubRequestsToApp.stream.sink.add(request);
        return MapEntry(id, jsonEncode(d.toInfrastructure().toJson()));
      });
    } else {
      final SceneEntity emptyScene = SceneEntity.empty();
      final RequestsAndStatusFromHub request = RequestsAndStatusFromHub(
        sendingType: SendingType.sceneType.name,
        allRemoteCommands: jsonEncode(emptyScene.toInfrastructure().toJson()),
      );
      HubRequestsToApp.stream.sink.add(request);
    }
  }

  @override
  Future sendAllEntities() async {
    final Map<String, DeviceEntityBase> entities =
        await IcSynchronizer().getEntities();

    final Map<String, String> entityIdEntityAsString = entities.map(
      (key, value) =>
          MapEntry(key, DeviceHelper.convertDomainToJsonString(value)),
    );

    final RequestsAndStatusFromHub request = RequestsAndStatusFromHub(
      sendingType: SendingType.allEntities.name,
      allRemoteCommands: jsonEncode(entityIdEntityAsString),
    );
    HubRequestsToApp.stream.sink.add(request);
  }

  @override
  Future sendAllAreas() async {
    final HashMap<String, AreaEntity> areas = await IcSynchronizer().getAreas();

    final Map<String, String> entityIdEntityAsString = areas.map(
      (key, value) =>
          MapEntry(key, jsonEncode(value.toInfrastructure().toJson())),
    );

    final RequestsAndStatusFromHub request = RequestsAndStatusFromHub(
      sendingType: SendingType.allAreas.name,
      allRemoteCommands: jsonEncode(entityIdEntityAsString),
    );
    HubRequestsToApp.stream.sink.add(request);
  }

  @override
  Future sendAllScenes() async {
    final HashMap<String, SceneEntity> automations =
        IcSynchronizer().getScenes();

    final Map<String, String> entityIdEntityAsString = automations.map(
      (key, value) =>
          MapEntry(key, jsonEncode(value.toInfrastructure().toJson())),
    );

    final RequestsAndStatusFromHub request = RequestsAndStatusFromHub(
      sendingType: SendingType.allScenes.name,
      allRemoteCommands: jsonEncode(entityIdEntityAsString),
    );
    HubRequestsToApp.stream.sink.add(request);
  }

  @override
  Future sendAllVendors() async {
    final List<VendorEntityInformation> vendors = IcSynchronizer().getVendors();

    final String jsonString =
        jsonEncode(vendors.map((e) => e.toJson()).toList());
    final RequestsAndStatusFromHub request = RequestsAndStatusFromHub(
      sendingType: SendingType.getAllSupportedVendors.name,
      allRemoteCommands: jsonEncode(jsonString),
    );
    HubRequestsToApp.stream.sink.add(request);
  }
}
