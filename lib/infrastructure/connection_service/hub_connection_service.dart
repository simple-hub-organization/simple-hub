part of 'package:cybearjinni/domain/connections_service.dart';

class _HubConnectionService implements ConnectionsService {
  _HubConnectionService(this.networkBssid) {
    if (currentEnvApp == EnvApp.prod) {
      hubPort = 50055;
    } else {
      hubPort = 60055;
    }
  }

  String networkBssid;

  /// Port to connect to the cbj hub, will change according to the current
  /// running environment
  late int hubPort;

  String? hubIp;
  String? networkName;

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
  Future searchDevices() async {
    try {
      final Either<HubFailures, Unit> locationRequest =
          await askLocationPermissionAndLocationOn();

      if (locationRequest.isLeft()) {
        return locationRequest;
      }

      logger.i('searchForHub');
      String? appDeviceIp;
      if (await Connectivity().checkConnectivity() == ConnectivityResult.wifi &&
          !kIsWeb) {
        final NetworkInfo networkInfo = NetworkInfo();
        networkName = await networkInfo.getWifiName();
        appDeviceIp = await networkInfo.getWifiIP();
      } else {
        return false;
        // if (deviceIpOnTheNetwork == null) {
        //   // Issue https://github.com/CyBear-Jinni/cbj_app/issues/256
        //   return left(
        //     const HubFailures
        //         .findingHubWhenConnectedToEthernetCableIsNotSupported(),
        //   );
        // }

        // currentDeviceIP = deviceIpOnTheNetwork;
        // networkBSSID = 'no:Network:Bssid:Found';
        // networkName = 'noNetworkNameFound';
        // if (isThatTheIpOfTheHub != null && isThatTheIpOfTheHub) {
        //   return insertHubInfo(
        //     networkIp: currentDeviceIP,
        //     networkBSSID: networkBSSID,
        //     networkName: networkName,
        //   );
        // }
      }
      if (appDeviceIp == null) {
        return false;
      }
      final String subnet =
          appDeviceIp.substring(0, appDeviceIp.lastIndexOf('.'));

      logger.i('Hub Search subnet IP $subnet');

      // TODO: Search for hub
      final Stream<ActiveHost> devicesWithPort =
          HostScannerService.instance.scanDevicesForSinglePort(
        subnet,
        hubPort,

        /// TODO: return this settings when can use with the await for loop
        // resultsInIpAscendingOrder: false,
        timeout: const Duration(milliseconds: 600),
      );

      await for (final ActiveHost activeHost in devicesWithPort) {
        logger.i('Found Cbj Hub device: ${activeHost.address}');
        hubIp = activeHost.address;
        return true;
        // if (networkBSSID != null && networkName != null) {
        // return insertHubInfo(
        //   networkIp: activeHost.address,
        //   networkBSSID: networkBSSID,
        //   networkName: networkName,
        // );
        // }
      }
    } catch (e) {
      logger.w('Exception searchForHub\n$e');
    }
  }

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
  Future setEtitiesToArea(String areaId, HashSet entities) async {}

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
    searchDevices();
    if (hubIp == null) {
      return false;
    }

    connectDirectlyToHub();

    return true;
  }

  Future<Either<HubFailures, Unit>> askLocationPermissionAndLocationOn() async {
    final Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    int permissionCounter = 0;
    int disabledCounter = 0;

    // Get location permission is not supported on Linux
    if (Platform.isLinux || Platform.isWindows) {
      return right(unit);
    }

    while (true) {
      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          logger.e('Permission to use location is denied');
          await Future.delayed(const Duration(seconds: 10));

          permissionCounter++;
          if (permissionCounter > 5) {
            permission_handler.openAppSettings();
          } else if (permissionCounter > 7) {
            return const Left(HubFailures.unexpected());
          }
          continue;
        }
      }

      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          disabledCounter++;
          if (disabledCounter > 2) {
            return const Left(HubFailures.unexpected());
          }
          logger.w('Location is disabled');
          await Future.delayed(const Duration(seconds: 5));
          continue;
        }
      }
      break;
    }
    return right(unit);
  }

  /// Connect directly to the Hub if possible
  Future connectDirectlyToHub() async {
    if (hubIp == null) {
      return;
    }

    // Socket? testHubConnection;
    // try {
    //   testHubConnection = await Socket.connect(
    //     hubIP,
    //     hubPort,
    //     timeout: const Duration(milliseconds: 500),
    //   );
    //   await testHubConnection.close();
    //   testHubConnection.destroy();
    //   testHubConnection = null;
    // } catch (e) {
    //   await testHubConnection?.close();
    //   testHubConnection?.destroy();
    // }

    try {
      // // TODO: DELTE
      // await HubClient.createStreamWithHub(
      //   hubIp!,
      //   hubPort,
      // );

      channel = ClientChannel(
        hubIp!,
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
