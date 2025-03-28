import 'dart:collection';
import 'dart:io';
import 'dart:isolate';

import 'package:integrations_controller/integrations_controller.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_empty_entity/generic_empty_entity.dart';
import 'package:integrations_controller/src/infrastructure/core/utils.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:upnp2/upnp.dart';

class SendToIsolate {
  SendToIsolate({
    required this.sendPort,
    required this.projectPath,
    required this.networkUtilitiesType,
    required this.isSnap,
    this.portByVendor,
    this.systemCommands,
  });
  bool isSnap;
  SendPort sendPort;
  String projectPath;
  HashMap<VendorsAndServices, List<int>>? portByVendor;
  INetworkUtilities? networkUtilitiesType;
  SystemCommandsBaseClassD? systemCommands;
}

class BackFromIsolate {
  BackFromIsolate(this.vendorsAndServices, this.genericUnsupportedDE);
  VendorsAndServices vendorsAndServices;
  DeviceEntityBase genericUnsupportedDE;
}

class SearchDevices {
  void dispose() {
    for (final Isolate isolate in isolates) {
      isolate.kill();
    }
  }

  List<Isolate> isolates = [];

  Future startSearchIsolate({
    INetworkUtilities? networkUtilitiesType,
    SystemCommandsBaseClassD? systemCommands,
  }) async {
    final INetworkUtilities networkUtilitiesTypeTemp =
        networkUtilitiesType ?? NetworkUtilities();
    final SystemCommandsBaseClassD? systemCommandsTemp =
        systemCommands ?? await setInstanceForDartNative();

    final String projectPath =
        await SystemCommandsBaseClassD.instance.getLocalDbPath();
    final bool isSnap =
        SharedVariables().getProjectRootDirectoryPath()?.contains('snap') ??
            false;

    _searchAllMdnsDevicesAndSetThemUpIsolate(
      projectPath: projectPath,
      networkUtilitiesType: networkUtilitiesType,
      isSnap: isSnap,
      systemCommands: systemCommands,
      networkUtilitiesTypeTemp: networkUtilitiesTypeTemp,
      systemCommandsTemp: systemCommandsTemp,
    );

    // TODO: Host name from ip does not work on Android https://github.com/dart-lang/sdk/issues/54435
    if (!Platform.isAndroid) {
      _pingSearchIsolate(
        projectPath: projectPath,
        networkUtilitiesType: networkUtilitiesType,
        isSnap: isSnap,
        systemCommands: systemCommands,
        networkUtilitiesTypeTemp: networkUtilitiesTypeTemp,
        systemCommandsTemp: systemCommandsTemp,
      );
    }

    _portSearchIsolate(
      projectPath: projectPath,
      networkUtilitiesType: networkUtilitiesType,
      isSnap: isSnap,
      systemCommands: systemCommands,
      networkUtilitiesTypeTemp: networkUtilitiesTypeTemp,
      systemCommandsTemp: systemCommandsTemp,
    );

    _upnpSearchIsolate(
      projectPath: projectPath,
      networkUtilitiesType: networkUtilitiesType,
      isSnap: isSnap,
      systemCommands: systemCommands,
      networkUtilitiesTypeTemp: networkUtilitiesTypeTemp,
      systemCommandsTemp: systemCommandsTemp,
    );
  }

  /// For mdns search
  Future _searchAllMdnsDevicesAndSetThemUpIsolate({
    required String projectPath,
    required INetworkUtilities? networkUtilitiesType,
    required bool isSnap,
    required SystemCommandsBaseClassD? systemCommands,
    required INetworkUtilities networkUtilitiesTypeTemp,
    SystemCommandsBaseClassD? systemCommandsTemp,
  }) async {
    final mdnsReceivePort = ReceivePort();
    final SendToIsolate searchDevices = SendToIsolate(
      sendPort: mdnsReceivePort.sendPort,
      projectPath: projectPath,
      networkUtilitiesType: networkUtilitiesTypeTemp,
      isSnap: isSnap,
      systemCommands: systemCommandsTemp,
    );
    final Isolate mdnsIsolate = await Isolate.spawn(
      _searchAllMdnsDevicesAndSetThemUp,
      searchDevices,
    );

    mdnsReceivePort.listen((data) {
      if (data is GenericUnsupportedDE) {
        VendorsConnectorConjecture().setMdnsDevice(data);
      }
    });

    mdnsIsolate.errors.listen((event) {
      icLogger.f('Mdns isolate had crashed $event');
    });
    isolates.add(mdnsIsolate);
  }

  /// For ping search
  Future _pingSearchIsolate({
    required String projectPath,
    required INetworkUtilities? networkUtilitiesType,
    required bool isSnap,
    required SystemCommandsBaseClassD? systemCommands,
    required INetworkUtilities networkUtilitiesTypeTemp,
    SystemCommandsBaseClassD? systemCommandsTemp,
  }) async {
    final ReceivePort pingReceivePort = ReceivePort();
    final SendToIsolate searchDevices = SendToIsolate(
      sendPort: pingReceivePort.sendPort,
      projectPath: projectPath,
      networkUtilitiesType: networkUtilitiesTypeTemp,
      isSnap: isSnap,
      systemCommands: systemCommandsTemp,
    );

    final Isolate pingIsolate = await Isolate.spawn(
      _searchPingableDevicesAndSetThemUpByHostName,
      searchDevices,
    );

    pingReceivePort.listen((data) {
      if (data is GenericUnsupportedDE) {
        VendorsConnectorConjecture().setHostNameDeviceByCompany(data);
      }
    });
    pingIsolate.errors.listen((event) {
      icLogger.f('Ping isolate had crashed $event');
    });
    isolates.add(pingIsolate);
  }

  /// For port search
  Future _portSearchIsolate({
    required String projectPath,
    required INetworkUtilities? networkUtilitiesType,
    required bool isSnap,
    required SystemCommandsBaseClassD? systemCommands,
    required INetworkUtilities networkUtilitiesTypeTemp,
    SystemCommandsBaseClassD? systemCommandsTemp,
  }) async {
    final HashMap<VendorsAndServices, List<int>>? ports =
        VendorsConnectorConjecture().portsToScan();
    final ReceivePort portReceivePort = ReceivePort();
    final SendToIsolate searchDevices = SendToIsolate(
      sendPort: portReceivePort.sendPort,
      projectPath: projectPath,
      networkUtilitiesType: networkUtilitiesTypeTemp,
      isSnap: isSnap,
      portByVendor: ports,
      systemCommands: systemCommandsTemp,
    );

    final Isolate portIsolate = await Isolate.spawn(
      _searchAllByPorts,
      searchDevices,
    );

    portReceivePort.listen((data) {
      if (data is BackFromIsolate) {
        VendorsConnectorConjecture().setHostNameDeviceByPort(
          data.vendorsAndServices,
          data.genericUnsupportedDE,
        );
      }
    });
    portIsolate.errors.listen((event) {
      icLogger.f('Port isolate had crashed $event');
    });
    isolates.add(portIsolate);
  }

  /// For UPnP search
  Future _upnpSearchIsolate({
    required String projectPath,
    required INetworkUtilities? networkUtilitiesType,
    required bool isSnap,
    required SystemCommandsBaseClassD? systemCommands,
    required INetworkUtilities networkUtilitiesTypeTemp,
    SystemCommandsBaseClassD? systemCommandsTemp,
  }) async {
    final receivePort = ReceivePort();
    final SendToIsolate searchDevices = SendToIsolate(
      sendPort: receivePort.sendPort,
      projectPath: projectPath,
      networkUtilitiesType: networkUtilitiesTypeTemp,
      isSnap: isSnap,
      systemCommands: systemCommandsTemp,
    );
    final Isolate mdnsIsolate = await Isolate.spawn(
      _searchAllUpnpDevicesAndSetThemUp,
      searchDevices,
    );

    receivePort.listen((data) {
      if (data is GenericUnsupportedDE) {
        VendorsConnectorConjecture().setUpnpDevice(data);
      }
    });

    mdnsIsolate.errors.listen((event) {
      icLogger.f('Mdns isolate had crashed $event');
    });
    isolates.add(mdnsIsolate);
  }

  Future _searchAllMdnsDevicesAndSetThemUp(
    SendToIsolate sendToIsolate,
  ) async {
    INetworkUtilities.instance = sendToIsolate.networkUtilitiesType;
    if (sendToIsolate.systemCommands == null) {
      return;
    }
    SystemCommandsBaseClassD.instance = sendToIsolate.systemCommands!;
    await INetworkUtilities.instance
        .configureNetworkTools(sendToIsolate.projectPath);

    final SendPort sendPort = sendToIsolate.sendPort;
    try {
      while (true) {
        while (true) {
          // TODO: mdns search crash if there is no local internet connection
          // but crash can't be cached using try catch.
          // InternetConnectionChecker().hasConnection; check if there is
          // connection to the www which is not needed for mdns search.
          // we need to replace this part with check that return true if
          // there is local internet connection/ device is connected to
          // local network.
          final bool result = await InternetConnectionChecker().hasConnection;
          if (result) {
            break;
          }
          icLogger.w('No internet connection detected, will try again in 2m to'
              ' search mdns in the network');
          await Future.delayed(const Duration(minutes: 2));
        }

        await for (final DeviceEntityBase entity
            in INetworkUtilities.instance.searchMdnsDevices()) {
          sendPort.send(entity);
        }
      }
    } catch (e) {
      icLogger.e('Mdns search error\n$e');
    }
  }

  Future _searchAllUpnpDevicesAndSetThemUp(
    SendToIsolate sendToIsolate,
  ) async {
    final SendPort sendPort = sendToIsolate.sendPort;
    try {
      while (true) {
        final disc = DeviceDiscoverer();
        const int port = 1900;
        await disc.start(ipv6: false);
        await for (final DiscoveredClient client
            in disc.quickDiscoverClients()) {
          try {
            final DeviceEntityBase? temp =
                await pnpToDeviceEntity(client, port);
            if (temp == null) {
              continue;
            }
            sendPort.send(temp);
          } catch (e, stack) {
            print('ERROR: $e - ${client.location}');
            print(stack);
          }
        }

        final disc2 = DeviceDiscoverer();
        const int port2 = 52323;
        await disc2.start(ipv6: false, port: port2);
        await for (final DiscoveredClient client
            in disc2.quickDiscoverClients()) {
          try {
            final DeviceEntityBase? temp =
                await pnpToDeviceEntity(client, port2);
            if (temp == null) {
              continue;
            }
            sendPort.send(temp);
          } catch (e, stack) {
            print('ERROR: $e - ${client.location}');
            print(stack);
          }
        }
        await Future.delayed(const Duration(seconds: 10));
      }
    } catch (e) {
      icLogger.e('Mdns search error\n$e');
    }
  }

  Future<DeviceEntityBase?> pnpToDeviceEntity(
      DiscoveredClient client, int port) async {
    final device = await client.getDevice();
    if (device == null) {
      return null;
    }
    final Uri? uri = Uri.tryParse(device.url ?? '');
    final String host = uri?.host ?? '';

    return GenericUnsupportedDE(
      uniqueId: CoreUniqueId(),
      entityUniqueId: EntityUniqueId(device.uuid),
      cbjDeviceVendor: CbjDeviceVendor(VendorsAndServices.undefined),
      cbjEntityName: CbjEntityName(
        value: device.friendlyName,
      ),
      deviceVendor: DeviceVendor(value: device.manufacturer),
      deviceNetworkLastUpdate: DeviceNetworkLastUpdate(),
      stateMassage: DeviceStateMassage(value: ''),
      senderDeviceOs: DeviceSenderDeviceOs(''),
      senderDeviceModel: DeviceSenderDeviceModel(''),
      senderId: DeviceSenderId(),
      compUuid: DeviceCompUuid(''),
      entityStateGRPC: EntityState.state(EntityStateGRPC.undefined),
      entityOriginalName: EntityOriginalName(device.friendlyName ?? ''),
      deviceOriginalName: DeviceOriginalName(value: device.friendlyName),
      powerConsumption: DevicePowerConsumption(''),
      deviceUniqueId: DeviceUniqueId(device.uuid),
      devicePort: DevicePort(value: port.toString()),
      deviceLastKnownIp: DeviceLastKnownIp(value: host),
      deviceHostName: DeviceHostName(value: ''),
      deviceMdns: DeviceMdns(value: ''),
      srvResourceRecord: DeviceSrvResourceRecord(input: ''),
      srvTarget: DeviceSrvTarget(input: ''),
      ptrResourceRecord: DevicePtrResourceRecord(input: ''),
      mdnsServiceType: DeviceMdnsServiceType(input: ''),
      devicesMacAddress: DevicesMacAddress(value: ''),
      entityKey: EntityKey(''),
      requestTimeStamp: RequestTimeStamp(''),
      lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp(''),
      entityCbjUniqueId: CoreUniqueId(),
    );
  }

  /// Get all the host names in the connected networks and try to add the device
  Future _searchPingableDevicesAndSetThemUpByHostName(
    SendToIsolate sendToIsolate,
  ) async {
    INetworkUtilities.instance = sendToIsolate.networkUtilitiesType;
    await INetworkUtilities.instance
        .configureNetworkTools(sendToIsolate.projectPath);

    final SendPort sendPort = sendToIsolate.sendPort;

    while (true) {
      await searchForAdress((subnet) async {
        try {
          if (sendToIsolate.isSnap) {
            // Spits to 2 requests for snap to fix error https://github.com/CyBear-Jinni-user/CBJ_Hub_Snap/issues/2

            final Stream<DeviceEntityBase> pingStream1 = INetworkUtilities
                .instance
                .getAllPingableDevicesAsync(subnet, lastHostId: 126);
            await for (final DeviceEntityBase entity in pingStream1) {
              sendPort.send(entity);
            }

            final Stream<DeviceEntityBase> pingStream2 = INetworkUtilities
                .instance
                .getAllPingableDevicesAsync(subnet, firstHostId: 127);
            await for (final DeviceEntityBase entity in pingStream2) {
              sendPort.send(entity);
            }
          } else {
            final Stream<DeviceEntityBase> pingStream1 =
                INetworkUtilities.instance.getAllPingableDevicesAsync(subnet);
            await for (final DeviceEntityBase entity in pingStream1) {
              sendPort.send(entity);
            }
          }
        } catch (e) {
          icLogger.i('Ping search Error $e');
        }
      });

      await Future.delayed(const Duration(seconds: 5));
    }
  }

  Future searchForAdress(Future Function(String subnet) callback) async {
    final List<NetworkInterface> networkInterfaceList =
        await NetworkInterface.list();

    for (final NetworkInterface networkInterface in networkInterfaceList) {
      for (final InternetAddress address in networkInterface.addresses) {
        final String ip = address.address;
        if (!ip.contains('.')) {
          continue;
        }
        final String subnet = ip.substring(0, ip.lastIndexOf('.'));
        await callback(subnet);
      }
    }
  }

  Future _searchAllByPorts(
    SendToIsolate sendToIsolate,
  ) async {
    if (sendToIsolate.portByVendor == null) {
      return;
    }
    INetworkUtilities.instance = sendToIsolate.networkUtilitiesType;
    await INetworkUtilities.instance
        .configureNetworkTools(sendToIsolate.projectPath);

    final SendPort sendPort = sendToIsolate.sendPort;
    while (true) {
      await searchForAdress((subnet) async {
        for (final MapEntry<VendorsAndServices, List<int>> vendorPorts
            in sendToIsolate.portByVendor!.entries) {
          final VendorsAndServices vendor = vendorPorts.key;
          for (final int port in vendorPorts.value) {
            final Stream<DeviceEntityBase> entityStream = INetworkUtilities
                .instance
                .scanDevicesForSinglePort(subnet, port);
            await for (final DeviceEntityBase entity in entityStream) {
              final BackFromIsolate backFromIsolate = BackFromIsolate(
                vendor,
                entity,
              );
              sendPort.send(backFromIsolate);
            }
          }
        }
        await Future.delayed(const Duration(seconds: 3));
      });
    }
  }

  // /// Searching for mqtt devices
  // Future _searchDevicesByMqttPath(SendPort sendPort) async {
  //   // getIt<TasmotaMqttConnectorConjecture>().discoverNewDevices();
  // }

  // /// Devices that we need to insert in to the other search options but didn't
  // /// got to it yet.
  // /// We do implement here the start of the search for convince organization
  // /// and since putting it in the constructor of singleton will be called
  // /// before all of our program.
  // Future
  // _notImplementedDevicesSearch(SendPort sendPort) async {
  //   // YeelightConnectorConjecture().discoverNewDevices();
  // }
}
