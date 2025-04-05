part of 'package:integrations_controller/src/domain/i_network_utilities.dart';

class NetworkUtilities implements INetworkUtilities {
  @override
  Future<GenericUnsupportedDE?> deviceFromPort(
    String address,
    int port,
  ) async {
    const Duration timeout = Duration(milliseconds: 2000);
    final network.ActiveHost? activeHost = await connectToPortImplementation(
      address: address,
      port: port,
      timeout: timeout,
    );

    if (activeHost == null) {
      return null;
    }
    return activeHostToEntity(activeHost);
  }

  Future<network.ActiveHost?> connectToPortImplementation({
    required String address,
    required int port,
    required Duration timeout,
  }) =>
      network.PortScannerService.instance.connectToPort(
        address: address,
        port: port,
        timeout: timeout,
        activeHostsController: StreamController<network.ActiveHost>(),
      );

  Future<GenericUnsupportedDE> activeHostToEntity(
    network.ActiveHost activeHost,
  ) async {
    final network.ARPData? arpData = await activeHost.arpData;
    String? deviceName = await activeHost.deviceName;
    if (deviceName == 'Generic Device') {
      deviceName = null;
    }
    final network.MdnsInfo? mdns = await activeHost.mdnsInfo;
    final network.Vendor? vendor = await activeHost.vendor;
    final String? hostName = await activeHost.hostName;
    final List<network.OpenPort> openPorts = activeHost.openPorts;
    final SrvResourceRecord? srvResourceRecord = mdns?.srvResourceRecord;
    final String? srvTarget = mdns?.mdnsSrvTarget;
    final String? ptrResourceRecord = mdns?.ptrResourceRecord.name;

    final String? mdnsServiceType = mdns?.mdnsServiceType;

    final int? port = openPorts.isNotEmpty
        ? openPorts.first.port
        : (srvResourceRecord?.port ?? mdns?.mdnsPort);

    return GenericUnsupportedDE(
      uniqueId: CoreUniqueId(),
      entityUniqueId: EntityUniqueId(arpData?.macAddress ?? activeHost.hostId),
      cbjDeviceVendor: CbjDeviceVendor(VendorsAndServices.undefined),
      cbjEntityName: CbjEntityName(
        value: deviceName ?? hostName ?? arpData?.hostname ?? '',
      ),
      deviceVendor: DeviceVendor(value: vendor?.vendorName),
      deviceNetworkLastUpdate:
          DeviceNetworkLastUpdate(value: vendor?.lastUpdate),
      stateMassage: DeviceStateMassage(value: ''),
      senderDeviceOs: DeviceSenderDeviceOs(''),
      senderDeviceModel: DeviceSenderDeviceModel(''),
      senderId: DeviceSenderId(),
      compUuid: DeviceCompUuid(''),
      entityStateGRPC: EntityState.state(EntityStateGRPC.undefined),
      entityOriginalName: EntityOriginalName(''),
      deviceOriginalName: DeviceOriginalName(value: deviceName),
      powerConsumption: DevicePowerConsumption(''),
      deviceUniqueId: DeviceUniqueId(arpData?.macAddress ?? activeHost.hostId),
      devicePort: DevicePort(value: port?.toString()),
      deviceLastKnownIp: DeviceLastKnownIp(value: activeHost.address),
      deviceHostName: DeviceHostName(value: hostName),
      deviceMdns: DeviceMdns(value: mdns?.mdnsDomainName),
      srvResourceRecord:
          DeviceSrvResourceRecord(input: srvResourceRecord?.name),
      srvTarget: DeviceSrvTarget(input: srvTarget),
      ptrResourceRecord: DevicePtrResourceRecord(input: ptrResourceRecord),
      mdnsServiceType: DeviceMdnsServiceType(input: mdnsServiceType),
      devicesMacAddress:
          DevicesMacAddress(value: arpData?.macAddress ?? vendor?.macPrefix),
      entityKey: EntityKey(''),
      requestTimeStamp: RequestTimeStamp(''),
      lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp(''),
      entityCbjUniqueId: CoreUniqueId(),
    );
  }

  @override
  Future configureNetworkTools(String dbDirectory) =>
      network.configureNetworkTools(dbDirectory);

  @override
  Stream<DeviceEntityBase> searchMdnsDevices() async* {
    final List<network.ActiveHost> activeHostList = await _searchMdnsDevices();
    for (final network.ActiveHost activeHost in activeHostList) {
      yield await activeHostToEntity(activeHost);
    }
  }

  Future<List<network.ActiveHost>> _searchMdnsDevices() async {
    final List<network.ActiveHost> activeHostList = [];

    for (network.ActiveHost activeHost
        in await network.MdnsScannerService.instance.searchMdnsDevices()) {
      // In some cases for some reason we get empty result when trying to
      // resolve mdns name to ip, the only way we found to fix that is to
      // use resolve it using avahi-resolve-host-name
      // TODO: Check if this part can be deleted after pr https://github.com/osociety/network_tools/pull/165#issuecomment-1826405925

      if (activeHost.address == '0.0.0.0') {
        final network.MdnsInfo? mdnsInfo = await activeHost.mdnsInfo;

        final String? srvTarget = mdnsInfo?.mdnsSrvTarget;
        if (srvTarget == null) {
          continue;
        }

        final String? deviceIp = await SystemCommandsBaseClassD.instance
            .getIpFromMdnsName(srvTarget, mdnsInfo!.mdnsServiceType);
        if (deviceIp == null) {
          continue;
        }
        try {
          activeHost = activeHost..internetAddress = InternetAddress(deviceIp);
        } catch (e) {
          icLogger.e('Error setting internet address $e');
        }
      }

      final network.MdnsInfo? mdnsInfo = await activeHost.mdnsInfo;

      if (mdnsInfo != null) {
        activeHostList.add(activeHost);
      }
    }
    return activeHostList;
  }

  @override
  Stream<DeviceEntityBase> scanDevicesForSinglePort(
    String subnet,
    int port,
  ) async* {
    final Stream<network.ActiveHost> stream2 =
        network.HostScannerService.instance.scanDevicesForSinglePort(
      subnet,
      port,
    );

    await for (final network.ActiveHost activeHost in stream2) {
      yield await activeHostToEntity(activeHost);
    }
  }

  @override
  Stream<DeviceEntityBase> getAllPingableDevicesAsync(
    String subnet, {
    int? firstHostId,
    int? lastHostId,
  }) async* {
    await for (final network.ActiveHost activeHost
        in getAllPingableDevicesAsyncImplementation(
      subnet,
      firstHostId: firstHostId,
      lastHostId: lastHostId,
    )) {
      yield await activeHostToEntity(activeHost);
    }
  }

  Stream<network.ActiveHost> getAllPingableDevicesAsyncImplementation(
    String subnet, {
    int? firstHostId,
    int? lastHostId,
  }) =>
      network.HostScannerService.instance.getAllPingableDevicesAsync(
        subnet,
        firstHostId:
            firstHostId ?? network.HostScannerService.defaultFirstHostId,
        lastHostId: lastHostId ?? network.HostScannerService.defaultLastHostId,
      );
}
