part of 'package:cybearjinni/domain/security_bear/i_security_bear_connection_repository.dart';

class _SecurityBearConnectionRepository
    implements ISecurityBearConnectionRepository {
  _SecurityBearConnectionRepository() {
    if (currentEnvApp == EnvApp.dev) {
      securityBearPort = 60052;
    } else {
      securityBearPort = 50052;
    }
  }

  /// Port to connect to the cbj securityBear, will change according to the current
  /// running environment
  late int securityBearPort;

  static SecurityBearEntity? securityBearEntity;

  // Future connectWithSecurityBear() async {
  //   if (securityBearEntity == null) {
  //     try {
  //       String? securityBearNetworkBssid;
  //
  //       String? securityBearNetworkName;
  //
  //       String? securityBearNetworkIp;
  //
  //       securityBearEntity = SecurityBearDtos(
  //         securityBearNetworkBssid: securityBearNetworkBssid!,
  //         lastKnownIp: securityBearNetworkIp!,
  //         networkName: securityBearNetworkName!,
  //       ).toDomain();
  //     } catch (e) {
  //       logger.e('Crashed while setting SecurityBear info from local db: $e');
  //     }
  //   }
  //
  //   ConnectivityResult? connectivityResult;
  //   try {
  //     connectivityResult = await Connectivity().checkConnectivity();
  //   } catch (e) {
  //     logger.w('Cant check connectivity this is probably PC, error: $e');
  //   }
  //
  //   // Last Number of bssid can change fix?, need to check if more numbers
  //   // can do that
  //   final String? savedWifiBssid =
  //       securityBearEntity?.securityBearNetworkBssid.getOrCrash();
  //   final String? savedWifiBssidWithoutLastNumber =
  //       savedWifiBssid?.substring(0, savedWifiBssid.lastIndexOf(':'));
  //
  //   final String? wifiBSSID = await NetworkInfo().getWifiBSSID();
  //   final String? wifiBSSIDWithoutLastNumber =
  //       wifiBSSID?.substring(0, wifiBSSID.lastIndexOf(':'));
  //
  //   // Check if you are connected to the home local network for direct
  //   // communication with the SecurityBear.
  //   // This block can be false also if user does not improve some permissions
  //   // or #256 if the app run on the computer and connected with ethernet cable
  //   // (not effecting connection with WiFi)
  //   if (connectivityResult != null &&
  //       connectivityResult == ConnectivityResult.wifi &&
  //       savedWifiBssidWithoutLastNumber != null &&
  //       wifiBSSIDWithoutLastNumber != null &&
  //       savedWifiBssidWithoutLastNumber == wifiBSSIDWithoutLastNumber) {
  //     logger.i('Connect using direct connection to SecurityBear');
  //
  //     if (securityBearEntity?.lastKnownIp.getOrCrash() != null) {
  //       Socket? testSecurityBearConnection;
  //       try {
  //         testSecurityBearConnection = await Socket.connect(
  //           securityBearEntity!.lastKnownIp.getOrCrash(),
  //           securityBearPort,
  //           timeout: const Duration(milliseconds: 500),
  //         );
  //         testSecurityBearConnection.destroy();
  //       } catch (e) {
  //         testSecurityBearConnection?.destroy();
  //
  //         await searchForSecurityBear();
  //       }
  //     } else {
  //       await searchForSecurityBear();
  //     }
  //
  //     await SecurityBearServerClient.createStreamWithSecurityBear(
  //       securityBearEntity!.lastKnownIp.getOrCrash(),
  //       securityBearPort,
  //     );
  //
  //     return;
  //   } else {
  //     logger.i('Connect using Remote Pipes');
  //     SecurityBearServerClient.createStreamWithSecurityBear(r, 50056);
  //     // Here for easy find and local testing
  //     // SecurityBearServerClient.createStreamWithSecurityBear('127.0.0.1', 50056);
  //   }
  // }

  @override
  Future<Either<SecurityBearFailures, CompSecurityBearInfo>>
      getSecurityBearCompInfo(
    CompSecurityBearInfo appInfoForSecurityBear,
  ) async {
    ConnectivityResult? connectivityResult;
    try {
      connectivityResult = await Connectivity().checkConnectivity();
    } catch (e) {
      logger.w('Cant check connectivity this is probably PC, error\n$e');
    }

    // Check if you are connected to the home local network for direct
    // communication with the SecurityBear.
    // This block can be false also if user does not improve some permissions
    // or #256 if the app run on the computer and connected with ethernet cable
    // (not effecting connection with WiFi)
    if (connectivityResult != null &&
        connectivityResult == ConnectivityResult.wifi) {
      logger.i('Connect using direct connection to SecurityBear');

      await searchForSecurityBear();

      if (securityBearEntity == null) {
        logger.e("Can't find Security Bear device in the local network");
        return left(const SecurityBearFailures.unexpected());
      }

      try {
        final CompSecurityBearInfo? compSecurityBearInfo =
            await SecurityBearServerClient.getSecurityBearCompInfo(
          addressToSecurityBear: securityBearEntity!.lastKnownIp.getOrCrash(),
          securityBearPort: securityBearPort,
          compSecurityBearInfo: appInfoForSecurityBear,
        );

        if (compSecurityBearInfo == null) {
          return left(const SecurityBearFailures.unexpected());
        }
        return right(compSecurityBearInfo);
      } catch (e) {
        logger.e('Error getting securityBearInfo\n$e');
        return left(const SecurityBearFailures.unexpected());
      }

      // return;
    } else {
      logger.i("Can't connect to Security Bear Out side of WiFi");
    }

    return left(const SecurityBearFailures.unexpected());
  }

  @override
  Future<Either<SecurityBearFailures, Unit>> searchForSecurityBear() async {
    try {
      securityBearEntity = null;
      final Either<SecurityBearFailures, Unit> locationRequest =
          await askLocationPermissionAndLocationOn();

      if (locationRequest.isLeft()) {
        return locationRequest;
      }

      logger.i('search for Security Bear');
      final String? wifiIP = await NetworkInfo().getWifiIP();

      final String subnet = wifiIP!.substring(0, wifiIP.lastIndexOf('.'));

      logger.i('Security Bear subnet IP $subnet');

      final Stream<ActiveHost> devicesWithPort =
          HostScannerService.instance.scanDevicesForSinglePort(
        subnet,
        securityBearPort,
        resultsInAddressAscendingOrder: false,
      );

      await for (final ActiveHost activeHost in devicesWithPort) {
        logger
            .i('Search and found Security Bear device: ${activeHost.address}');

        final String? wifiBSSID = await NetworkInfo().getWifiBSSID();
        final String? wifiName = await NetworkInfo().getWifiName();

        if (wifiBSSID != null && wifiName != null) {
          securityBearEntity = SecurityBearEntity(
            securityBearNetworkBssid: SecurityBearNetworkBssid(wifiBSSID),
            networkName: SecurityBearNetworkName(wifiName),
            lastKnownIp: SecurityBearNetworkIp(activeHost.address),
          );

          return right(unit);
        }
      }
    } catch (e) {
      logger.w('Exception searchForSecurityBear $e');
    }
    return left(const SecurityBearFailures.cantFindSecurityBearInNetwork());
  }

  Future<Either<SecurityBearFailures, Unit>>
      askLocationPermissionAndLocationOn() async {
    final Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    int permissionCounter = 0;

    if (kIsWeb) {
      return left(
        const SecurityBearFailures
            .automaticSecurityBearSearchNotSupportedOnWeb(),
      );
    }
    if (!Platform.isLinux && !Platform.isWindows) {
      while (true) {
        permissionGranted = await location.hasPermission();
        if (permissionGranted == PermissionStatus.denied) {
          permissionGranted = await location.requestPermission();
          if (permissionGranted != PermissionStatus.granted) {
            logger.e('Permission to use location is denied');
            permissionCounter++;
            if (permissionCounter > 5) {
              permission_handler.openAppSettings();
            }
            continue;
          }
        }

        serviceEnabled = await location.serviceEnabled();
        if (!serviceEnabled) {
          serviceEnabled = await location.requestService();
          if (!serviceEnabled) {
            logger.e('Location is disabled');
            continue;
          }
        }
        break;
      }
    }
    return right(unit);
  }

  @override
  Future<Either<SecurityBearFailures, Unit>> setSecurityBearWiFiInformation(
    CbjCompEntity compEntity,
  ) async {
    try {
      final ManageNetworkEntity firstWifiEntityOrFailure =
          ManageNetworkEntity(name: ManageWiFiName('CyBear Jinni'));

      final ManageNetworkEntity secondWifiEntityOrFailure =
          IManageNetworkRepository.manageWiFiEntity!;

      final SBCommendStatus commendStatus =
          await SecurityBearServerClient.setWiFisInformation(
        deviceIp: compEntity.lastKnownIp.getOrCrash(),
        devicePort: securityBearPort,
        firstWiFiName: firstWifiEntityOrFailure.name!.getOrCrash(),
        firstWiFiPassword: firstWifiEntityOrFailure.pass!.getOrCrash(),
        secondWiFiName: secondWifiEntityOrFailure.name!.getOrCrash(),
        secondWiFiPassword: secondWifiEntityOrFailure.pass!.getOrCrash(),
      );

      if (commendStatus.success) {
        return right(unit);
      }
      return left(const SecurityBearFailures.unexpected());
    } catch (e) {
      return left(const SecurityBearFailures.unexpected());
    }
  }

  @override
  Future<Either<SecurityBearFailures, Unit>>
      searchForSecurityBearInCurrentNetwork() async {
    try {
      final Either<SecurityBearFailures, Unit> locationRequest =
          await askLocationPermissionAndLocationOn();

      if (locationRequest.isLeft()) {
        return locationRequest;
      }

      logger.i('Searching for Security Bear in current network');
      final String? wifiIP = await NetworkInfo().getWifiIP();

      final String subnet = wifiIP!.substring(0, wifiIP.lastIndexOf('.'));

      logger.i('Security Bear subnet IP search $subnet');

      final Stream<ActiveHost> devicesWithPort =
          HostScannerService.instance.scanDevicesForSinglePort(
        subnet,
        securityBearPort,
        resultsInAddressAscendingOrder: false,
      );

      await for (final ActiveHost address in devicesWithPort) {
        logger.i(
          'Found Security Bear device in current network, address: ${address.address}',
        );

        final String? wifiBSSID = await NetworkInfo().getWifiBSSID();
        final String? wifiName = await NetworkInfo().getWifiName();

        if (wifiBSSID != null && wifiName != null) {
          return right(unit);
        }
      }
    } catch (e) {
      logger.w('Exception searching for Security Bear\n$e');
    }
    return left(const SecurityBearFailures.cantFindSecurityBearInNetwork());
  }
}
