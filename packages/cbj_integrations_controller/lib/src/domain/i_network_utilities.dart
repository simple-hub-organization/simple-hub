import 'dart:async';
import 'dart:io';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_empty_entity/generic_empty_entity.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/src/infrastructure/system_commands/system_commands_base_class_d.dart';
import 'package:multicast_dns/multicast_dns.dart';
import 'package:network_tools/network_tools.dart' as network;

part 'package:cbj_integrations_controller/src/infrastructure/network_utilities.dart';

abstract class INetworkUtilities {
  static INetworkUtilities? _instance;

  static INetworkUtilities get instance {
    return _instance ??= NetworkUtilities();
  }

  static set instance(INetworkUtilities? instance) {
    _instance = instance;
  }

  Stream<DeviceEntityBase> searchMdnsDevices();

  Stream<DeviceEntityBase> scanDevicesForSinglePort(
    String subnet,
    int port,
  );
  Stream<DeviceEntityBase> getAllPingableDevicesAsync(
    String subnet, {
    int? firstHostId,
    int? lastHostId,
  });

  Future configureNetworkTools(String dbDirectory);

  Future<GenericUnsupportedDE?> deviceFromPort(String address, int port);
}
