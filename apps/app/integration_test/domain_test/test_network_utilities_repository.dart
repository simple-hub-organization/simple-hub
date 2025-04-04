import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_empty_entity/generic_empty_entity.dart';
import 'package:integrations_controller/src/domain/i_network_utilities.dart';

class TestNetworkUtilitiesRepository extends INetworkUtilities {
  TestNetworkUtilitiesRepository() {
    INetworkUtilities.instance = this;
  }

  @override
  Future configureNetworkTools(String dbDirectory) async {}

  @override
  Future<GenericUnsupportedDE?> deviceFromPort(
          String address, int port) async =>
      null;

  @override
  Stream<DeviceEntityBase> getAllPingableDevicesAsync(String subnet,
          {int? firstHostId, int? lastHostId}) =>
      const Stream.empty();

  @override
  Stream<DeviceEntityBase> scanDevicesForSinglePort(String subnet, int port) =>
      const Stream.empty();

  @override
  Stream<DeviceEntityBase> searchMdnsDevices() => const Stream.empty();
}
