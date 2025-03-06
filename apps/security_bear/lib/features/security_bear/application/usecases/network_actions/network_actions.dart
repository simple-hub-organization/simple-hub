import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:security_bear/features/security_bear/infrastructure/core/network_entity.dart';
import 'package:security_bear/infrastructure/app_client/cbj_app_client.dart';
import 'package:security_bear/utils.dart';

///  Network action class used for
///  controlling the program in the different network status
class NetworkActions {
  NetworkActions(
    NetworkEntity firstAndAdminNetworkDefaultF,
    NetworkEntity secondNetworkDefaultF,
  ) {
    firstAndAdminNetworkDefault = firstAndAdminNetworkDefaultF;
    secondNetworkDefault = secondNetworkDefaultF;
  }
  static NetworkEntity? firstAndAdminNetworkDefault;
  static NetworkEntity? secondNetworkDefault;

  ///  This function starts the connection to the requested WiFi
  ///  if the internet connection is down
  Future<bool?> isConnectedToTheInternet() async {
    logger.i('Status is ${await isConnectedToInternet()}');
    bool processLocation = false;
    //  true = Started the process to connect to the admin WiFi,
    //  false = waiting for the internet to go down

    final Stream<InternetConnectionStatus> listener = returnStatusIfChanged();

    listener.listen((InternetConnectionStatus status) async {
      final bool isConnected = connectionStatusToBool(status);
      if (isConnected) {
        logger.i('Connected to the Internet');
        processLocation = false;
      } else {
        logger.w('Does not connected to the Internet');
        processLocation = true;
        await Future.delayed(
          const Duration(seconds: 15),
        ); // Wait to check if internet is back

        // Continue only if internet is till off after timeout
        if (!processLocation) {
          return;
        }

        //  TODO: Get the available networks
        await getAvailableNetworksList();
        //  TODO: Keep until the admin wi-fi founded
        //  TODO: Check in between if connection returned with processLocation var
        //  TODO: Connect to admin wi-fi

        logger.v('Finally');
      }
    });
    return null;
  }

  ///  Check to see if admin wifi exist and try to connect to it
  Future<void> connectToAdminWhenExist() async {
    String connectedWifiName;
    while (true) {
      connectedWifiName = await getConnectedNetworkName();
      if (connectedWifiName != firstAndAdminNetworkDefault!.networkName &&
          (await getAvailableNetworksList())
              .contains(firstAndAdminNetworkDefault!.networkName)) {
        logger.i(
          'Connecting to admin wi-fi named '
          '${firstAndAdminNetworkDefault!.networkName}',
        );
        await connectToAdminWiFi(
          ssid: firstAndAdminNetworkDefault!.networkName!,
          pass: firstAndAdminNetworkDefault!.networkPass!,
        );
      } else if (connectedWifiName ==
          firstAndAdminNetworkDefault!.networkName) {
        final String? wiFiDefaultGateway = await getDefaultGateway();
        final String myDeviceIP =
            await getCurrentDeviceIP(defaultGateway: wiFiDefaultGateway);

        await CBJAppClient.sendMyIPToServer(
          wiFiDefaultGateway!,
          myDeviceIP,
        );
      }
      // If the device is not connected to any WiFi
      // will try reconnecting to the last network
      else if (connectedWifiName == '' ||
          connectedWifiName != secondNetworkDefault!.networkName &&
              (await getAvailableNetworksList())
                  .contains(secondNetworkDefault!.networkName)) {
        await connectToWiFi(
          secondNetworkDefault!.networkName!,
          secondNetworkDefault!.networkPass!,
        );
      }

      await Future.delayed(
        const Duration(seconds: 15),
      ); // Wait to check if internet is back
    }
  }

  ///  This function check if there is WiFi with the name that it got,
  ///  if true it will try to connect to it with the password that it got
  Future<void> connectToAdminWiFi({
    String ssid = 'ho',
    String pass = '123',
  }) async {
    final String connectingResult = await connectToWiFi(ssid, pass);
    logger.i('This is connection result: $connectingResult');
    // TODO: fix if connectingResult is 'Error: Connection activation failed: (60) New connection activation was enqueued.'
    // Need to delete it with 'nmcli con delete <SSID>' and than can connect again
  }

  ///  This function return the new value of the internet connection status
  ///  only if it changed from last time
  Stream<InternetConnectionStatus> returnStatusIfChanged() {
    return InternetConnectionChecker().onStatusChange;
  }

  Future<bool> isConnectedToInternet() async {
    return connectionStatusToBool(
      await InternetConnectionChecker().connectionStatus,
    );
  }

  ///  Convert connection status to true (connected) false (disconnected)
  bool connectionStatusToBool(InternetConnectionStatus status) {
    switch (status) {
      case InternetConnectionStatus.connected:
        return true;
      case InternetConnectionStatus.disconnected:
        return false;
    }
  }

  ///  Return list of available networks to the device
  Future<List<String>> getAvailableNetworksList() async {
//    Not Working with snap from apt
    return Process.run('nmcli', <String>['-t', '-f', 'ssid', 'dev', 'wifi'])
        .then((ProcessResult results) {
      //  nmcli -t -f ssid dev wifi
      List<String> wifiResults = results.stdout.toString().split('\n');
      wifiResults = wifiResults.sublist(0, wifiResults.length - 1);
      logger.i('Found the following WiFi networks $wifiResults');
      return wifiResults;
    });
  }

  ///  Connect to the WiFi
  Future<String> connectToWiFi(String ssid, String pass) async {
    // Not Working with snap from apt

    // TODO check if can be replaced with commands from https://pub.dev/packages/nm/changelog
    return Process.run('nmcli', <String>[
      'dev',
      'wifi',
      'connect',
      ssid,
      'password',
      pass,
    ]).then((
      // nmcli dev wifi connect ssid password pass
      //  sudo nmcli dev wifi connect ssid password pass
      ProcessResult results,
    ) {
      logger.i('Connected successfully to: ${results.stdout}');
      return results.stdout.toString();
    });
    //    Can iwconfig also be used but
    //    require root: iwconfig wlp3s0 essid ssid key pass
  }

  ///  Check if connected to network,
  ///  if there is a connection than return network name
  Future<String> getConnectedNetworkName() async {
    return Process.run('iwgetid', <String>['-r']).then((ProcessResult results) {
      logger.i('Currently connected to: ${results.stdout}');
      return results.stdout.toString().replaceAll('\n', '');
    });

//    Not Working with snap from apt
//    return await Process.run('nmcli',
//        ['-t', '-f', 'ssid,In-USE', 'dev', 'wifi'
//        ]).then((ProcessResult results) {
//      print(results.stdout.toString());
//
//      return results.stdout.toString().replaceAll('\n', '');
//    });
  }

  /// Getting the current device ip
  Future<String> getCurrentDeviceIP({String? defaultGateway}) async {
    String currentIP = await Process.run('hostname', <String>['-I'])
        .then((ProcessResult results) {
      return results.stdout.toString().replaceAll('\n', '');
    });

    if (currentIP.isNotEmpty && currentIP.contains(' ')) {
      final List<String> currentIPList = currentIP.split(' ');
      currentIPList.removeWhere((String element) => element == '');

      if (defaultGateway != null && defaultGateway.isNotEmpty) {
        final String defaultGatewayWithoutLastNumber =
            ipWithoutLastNumber(defaultGateway);
        final String currentIpHelper = currentIPList.firstWhere(
          (String element) =>
              ipWithoutLastNumber(element) == defaultGatewayWithoutLastNumber,
        );
        currentIP = currentIpHelper;
      } else {
        currentIP = currentIPList[Random().nextInt(currentIPList.length)];
      }
    }
    logger.i('Device IP is: $currentIP');
    return currentIP;
  }

  /// Getting the default gateway of connected network
  Future<String?> getDefaultGateway({String? currentIP}) async {
    String defaultGateway = await Process.run('ip', <String>['route'])
        .then((ProcessResult results) {
      return results.stdout.toString();
    });

    final List<String> gatewayLinesWithDefault = [];

    final List<String> gatewayTemp = defaultGateway.split('\n');
    gatewayTemp.removeWhere((String element) => element == '');

    if (gatewayTemp.isEmpty) {
      return null;
    }

    for (final String gatewayLine in gatewayTemp) {
      if (gatewayLine.contains('default')) {
        gatewayLinesWithDefault.add(gatewayLine);
      }
    }

    String? gateway;
    if (gatewayLinesWithDefault.length > 1) {
      if (currentIP != null && currentIP.isNotEmpty) {
        final String currentIPWithoutLastNumber =
            currentIP.substring(0, currentIP.lastIndexOf('.'));
        for (final String gatewayLine in gatewayLinesWithDefault) {
          if (gatewayLine.contains(currentIPWithoutLastNumber)) {
            return extractIpFromLine(gatewayLine);
          }
        }
        return gateway;
      }
      defaultGateway = gatewayLinesWithDefault[
          Random().nextInt(gatewayLinesWithDefault.length)];
    } else {
      defaultGateway = gatewayLinesWithDefault[0];
    }

    if (defaultGateway.isEmpty) {
      return null;
    }

    return extractIpFromLine(defaultGateway);
  }

  /// Getting string with IP and returning only the IP
  String? extractIpFromLine(String iPWithLine) {
    final RegExp firstNumberRegExp = RegExp('[0-9]+');
    final int ipIndex = iPWithLine.indexOf(firstNumberRegExp);
    if (ipIndex < 0) {
      return null;
    }

    final String ip = iPWithLine.substring(ipIndex);
    return ip.substring(0, ip.indexOf(' '));
  }

  String ipWithoutLastNumber(String ip) {
    final String ipWithoutLastNumber = ip.substring(0, ip.lastIndexOf('.'));
    return ipWithoutLastNumber;
  }
}
