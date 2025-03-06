import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/tasmota/tasmota_ip/tasmota_ip_helpers.dart';

class TasmotaIpConnectorConjecture extends VendorConnectorConjectureService {
  factory TasmotaIpConnectorConjecture() => _instance;

  TasmotaIpConnectorConjecture._singletonContractor()
      : super(
          VendorsAndServices.tasmota,
          displayName: 'Tasmota',
          imageUrl: 'https://i.ibb.co/XZLGCRd/Tasmota-logo.png',
          deviceHostNameLowerCaseList: ['tasmota'],
        );

  static final TasmotaIpConnectorConjecture _instance =
      TasmotaIpConnectorConjecture._singletonContractor();

  // This is how you can interact tasmota using network calls.
  // http://ip/cm?cmnd=SetOption19%200
  // http://ip/cm?cmnd=MqttHost%200

  @override
  Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
    DeviceEntityBase entity, {
    bool fromDb = false,
  }) =>
      TasmotaIpHelpers.addDiscoveredDevice(entity);
}
