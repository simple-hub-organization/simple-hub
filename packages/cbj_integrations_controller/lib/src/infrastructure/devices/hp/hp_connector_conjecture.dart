import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/hp/hp_helpers.dart';

class HpConnectorConjecture extends VendorConnectorConjectureService {
  factory HpConnectorConjecture() => _instance;

  HpConnectorConjecture._singletonContractor()
      : super(
          VendorsAndServices.hp,
          displayName: 'HP',
          imageUrl:
              'https://play-lh.googleusercontent.com/UF16mldRKpQUUWhRZlDnT1FjkAjWSu9NXVBEDoTgScI_eo_6yEL0oKtc2-OvPXcG3PmN=s180',
          uniqeMdnsList: ['_hplib._tcp'],
          mdnsList: ['_ipp._tcp'],
          uniqueIdentifierNameInMdns: ['HP'],
        );

  static final HpConnectorConjecture _instance =
      HpConnectorConjecture._singletonContractor();

  @override
  Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
    DeviceEntityBase entity, {
    bool fromDb = false,
  }) =>
      HpHelpers.addDiscoveredDevice(entity);
}
