import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/google/google_helpers.dart';

class GoogleConnectorConjecture extends VendorConnectorConjectureService {
  factory GoogleConnectorConjecture() => _instance;

  GoogleConnectorConjecture._singletonContractor()
      : super(
          VendorsAndServices.google,
          displayName: 'Google',
          imageUrl:
              'https://play-lh.googleusercontent.com/aFWiT2lTa9CYBpyPjfgfNHd0r5puwKRGj2rHpdPTNrz2N9LXgN_MbLjePd1OTc0E8Rl1=s180',
          uniqeMdnsList: ['_googlecast._tcp', '_androidtvremote2._tcp'],
          mdnsList: ['_rc._tcp'],
          uniqueIdentifierNameInMdns: ['google', 'android', 'chrome'],
        );

  static final GoogleConnectorConjecture _instance =
      GoogleConnectorConjecture._singletonContractor();

  @override
  Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
    DeviceEntityBase entity, {
    bool fromDb = false,
  }) =>
      GoogleHelpers.addDiscoveredDevice(entity);
}
