import 'dart:async';
import 'dart:collection';

import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:integrations_controller/src/infrastructure/devices/shelly/shelly_helpers.dart';

class ShellyConnectorConjecture extends VendorConnectorConjectureService {
  factory ShellyConnectorConjecture() => _instance;

  ShellyConnectorConjecture._singletonContractor()
      : super(
          VendorsAndServices.shelly,
          displayName: 'Shelly',
          imageUrl:
              'https://play-lh.googleusercontent.com/cwAyt0LIs4cyXSs2jr79xjAxsuq4KoBTZNq__gpeQvupH-8PElGn6kiddx8-WfG8wEPl=s180',
          mdnsList: ['_http._tcp'],
          uniqueIdentifierNameInMdns: ['shelly'],
        );

  static final ShellyConnectorConjecture _instance =
      ShellyConnectorConjecture._singletonContractor();

  @override
  Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
    DeviceEntityBase entity, {
    bool fromDb = false,
  }) =>
      ShellyHelpers.addDiscoveredDevice(entity);
}
