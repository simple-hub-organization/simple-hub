part of 'package:cybearjinni/domain/connections_service.dart';

class _RemotePipesConnectionService implements ConnectionsService {
  _RemotePipesConnectionService(this.networkBssid);

  /// Port to connect to the cbj hub, will change according to the current
  /// running environment
  int hubPort = 50051;

  String? address;
  String networkBssid;

  ClientChannel? channel;
  CbjHubClient? stub;

  StreamController<MapEntry<String, DeviceEntityBase>>? entitiesStream;
  StreamController<MapEntry<String, AreaEntity>>? areasStream;

  BehaviorSubject<RequestsAndStatusFromHub> hubMessagesToApp =
      BehaviorSubject<RequestsAndStatusFromHub>();

  // StreamController<ClientStatusRequests> appMessagesToHub =
  //     StreamController<ClientStatusRequests>();

  BehaviorSubject<ClientStatusRequests> appMessagesToHub = BehaviorSubject();

  @override
  Future dispose() async {
    entitiesStream?.close();
  }

  @override
  Future<HashMap<String, DeviceEntityBase>> get getEntities async {
    appMessagesToHub.sink.add(
      ClientStatusRequests(sendingType: SendingType.allEntities.name),
    );
    final HashMap<String, DeviceEntityBase> entities = HashMap();

    await for (final RequestsAndStatusFromHub message
        in hubMessagesToApp.stream) {
      final SendingType sendingType =
          SendingTypeExtension.fromString(message.sendingType);
      if (sendingType != SendingType.allEntities) {
        continue;
      }

      try {
        final Map<String, String> entitiesMap = Map<String, String>.from(
          jsonDecode(message.allRemoteCommands) as Map<String, dynamic>,
        );
        entities.addEntries(
          entitiesMap.entries.map(
            (e) => MapEntry(
              e.key,
              DeviceHelper.convertJsonStringToDomain(e.value),
            ),
          ),
        );
      } catch (e) {
        logger.e('Error converting entities\n$e');
      }
      break;
    }

    return entities;
  }

  @override
  Future<HashMap<String, AreaEntity>> get getAreas async {
    appMessagesToHub.sink.add(
      ClientStatusRequests(sendingType: SendingType.allAreas.name),
    );

    final HashMap<String, AreaEntity> areas = HashMap();

    await for (final RequestsAndStatusFromHub message
        in hubMessagesToApp.stream) {
      final SendingType sendingType =
          SendingTypeExtension.fromString(message.sendingType);
      if (sendingType != SendingType.allAreas) {
        continue;
      }

      try {
        final Map<String, String> entitiesMap = Map<String, String>.from(
          jsonDecode(message.allRemoteCommands) as Map<String, dynamic>,
        );
        areas.addEntries(
          entitiesMap.entries.map(
            (e) => MapEntry(
              e.key,
              AreaEntityDtos.fromJson(
                jsonDecode(e.value) as Map<String, dynamic>,
              ).toDomain(),
            ),
          ),
        );
      } catch (e) {
        logger.e('Error converting areas\n$e');
      }
      break;
    }

    return areas;
  }

  @override
  Future<HashMap<String, SceneCbjEntity>> get getScenes async {
    appMessagesToHub.sink.add(
      ClientStatusRequests(sendingType: SendingType.allScenes.name),
    );

    final HashMap<String, SceneCbjEntity> scenesMap = HashMap();

    await for (final RequestsAndStatusFromHub message
        in hubMessagesToApp.stream) {
      final SendingType sendingType =
          SendingTypeExtension.fromString(message.sendingType);
      if (sendingType != SendingType.allScenes) {
        continue;
      }

      try {
        final Map<String, String> entities = Map<String, String>.from(
          jsonDecode(message.allRemoteCommands) as Map<String, dynamic>,
        );
        scenesMap.addEntries(
          entities.entries.map(
            (e) => MapEntry(
              e.key,
              SceneCbjDtos.fromJson(jsonDecode(e.value) as Map<String, dynamic>)
                  .toDomain(),
            ),
          ),
        );
      } catch (e) {
        logger.e('Error converting scenes\n$e');
      }
      break;
    }

    return scenesMap;
  }

  @override
  Future searchDevices() async {}

  @override
  void setEntityState(RequestActionObject action) {
    appMessagesToHub.sink.add(
      ClientStatusRequests(
        sendingType: SendingType.setEntitiesAction.name,
        allRemoteCommands: action.toInfrastructure().toJsonString(),
      ),
    );
  }

  @override
  Stream<MapEntry<String, DeviceEntityBase>> watchEntities() {
    entitiesStream?.close();

    entitiesStream = StreamController.broadcast();
    return entitiesStream!.stream;
  }

  @override
  Stream<MapEntry<String, AreaEntity>> watchAreas() {
    areasStream?.close();

    areasStream = StreamController.broadcast();
    return areasStream!.stream;
  }

  @override
  Future setNewArea(AreaEntity area) async {}

  @override
  Future setEntitiesToArea(String areaId, HashSet entities) async {}

  @override
  Future addScene(SceneCbjEntity scene) async {}

  @override
  Future activateScene(String id) async {}

  @override
  Future loginVendor(VendorLoginEntity value) async {}

  @override
  Future<List<VendorEntityInformation>> getVendors() async =>
      IcSynchronizer().getVendors();

  @override
  Future<bool> connect({String? address}) async {
    this.address = address;
    if (this.address == null) {
      return false;
    }

    connectHelper();

    return true;
  }

  /// Connect directly to the Hub if possible
  Future connectHelper() async {
    if (address == null) {
      return;
    }

    try {
      channel = ClientChannel(
        address!,
        port: hubPort,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()),
      );

      channel!.onConnectionStateChanged.listen((event) {
        logger.i('gRPC connection state $event');
      });

      stub = CbjHubClient(channel!);

      final ResponseStream<RequestsAndStatusFromHub> response =
          stub!.clientTransferEntities(
        appMessagesToHub.stream,
      );

      // appMessagesToHub.sink
      //     .add(ClientStatusRequests(sendingType: SendingType.firstConnection));

      hubMessagesToApp.addStream(response);
      await Future.delayed(const Duration(seconds: 3));
    } catch (e) {
      logger.e('Caught error while stream with hub\n$e');
      await channel?.shutdown();
    }
  }
}
