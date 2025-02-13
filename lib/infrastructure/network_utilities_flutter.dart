import 'dart:async';

import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:network_tools_flutter/network_tools_flutter.dart'
    as network_flutter;
import 'package:network_tools_flutter/network_tools_flutter.dart';

class NetworkUtilitiesFlutter extends NetworkUtilities {
  @override
  Stream<network_flutter.ActiveHost> getAllPingableDevicesAsyncImplementaion(
    String subnet, {
    int? firstHostId,
    int? lastHostId,
  }) =>
      network_flutter.HostScannerService.instance.getAllPingableDevices(
        subnet,
        firstHostId: firstHostId ?? HostScannerService.defaultFirstHostId,
        lastHostId: lastHostId ?? HostScannerService.defaultLastHostId,
      );

  @override
  Future<network_flutter.ActiveHost?> connectToPortImplementation({
    required String address,
    required int port,
    required Duration timeout,
  }) =>
      network_flutter.PortScannerService.instance.connectToPort(
        address: address,
        port: port,
        timeout: timeout,
        activeHostsController: StreamController<network_flutter.ActiveHost>(),
      );

  @override
  Future configureNetworkTools(String dbDirectory) async =>
      configureNetworkToolsFlutter(dbDirectory);
  // TODO: Add support for mdns using for ios
  //   mdnsSearch(){

  //     tcpSrvRecordsList;
  //       final discovery = BonsoirDiscovery(type: _domain);
  // await discovery.ready;
  //   }
}
