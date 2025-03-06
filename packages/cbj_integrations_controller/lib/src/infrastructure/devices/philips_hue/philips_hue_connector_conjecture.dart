import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/philips_hue/philips_hue_helpers.dart';

class PhilipsHueConnectorConjecture extends VendorConnectorConjectureService {
  factory PhilipsHueConnectorConjecture() => _instance;

  PhilipsHueConnectorConjecture._singletonContractor()
      : super(
          VendorsAndServices.philipsHue,
          displayName: 'Philips Hue',
          imageUrl:
              'https://play-lh.googleusercontent.com/FUlW6h3cACamheiCHH1cE67irohAZq_dJ92irK92cryKwHUtY6ZTSv5d041qPZ9UOt3n=s180',
          uniqeMdnsList: ['_hue._tcp'],
          // TODO: what type  loginType: VendorLoginTypes.,
        );

  static final PhilipsHueConnectorConjecture _instance =
      PhilipsHueConnectorConjecture._singletonContractor();

  static bool gotHueHubIp = false;

  @override
  Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
    DeviceEntityBase entity, {
    bool fromDb = false,
  }) =>
      PhilipsHueHelpers.addDiscoveredDevice(entity);
}
