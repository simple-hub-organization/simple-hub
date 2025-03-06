import 'dart:async';
import 'dart:collection';

import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:integrations_controller/src/infrastructure/devices/sensibo/sensibo_helpers.dart';
import 'package:integrations_controller/src/infrastructure/vendors_connector_conjecture.dart';
import 'package:sensibo/sensibo.dart';

class SensiboConnectorConjecture extends VendorConnectorConjectureService {
  factory SensiboConnectorConjecture() => _instance;

  SensiboConnectorConjecture._singletonContractor()
      : super(
          VendorsAndServices.sensibo,
          displayName: 'Sensibo',
          imageUrl:
              'https://play-lh.googleusercontent.com/COcX-itAruFvtOY3_jioXKsWtwOq4sl1RCUgwmTkU7XeJatybFZnV3Zl3ldTelUEGQ71=s180',
          urlToLoginCredentials: 'https://home.sensibo.com/me/api',
          loginType: VendorLoginTypes.apiKey,
        );

  SensiboUtilties? sensiboUtilties;

  @override
  Future loginApiKey(String value) async {
    sensiboUtilties = SensiboUtilties(value);
    searchEntities();
  }

  Future searchEntities() async {
    final List<SensiboBase> devices = await sensiboUtilties!.getDevices();

    for (final SensiboBase device in devices) {
      for (final DeviceEntityBase entity
          in (await SensiboHelpers.addDiscoveredDevice(device)).values) {
        await VendorsConnectorConjecture().foundEntityOfVendor(
          vendorConnectorConjectureService: this,
          entity: entity,
          entityCbjUniqueId: entity.entityCbjUniqueId.getOrCrash(),
        );
      }
    }
  }

  HashMap<String, SensiboBase> entitesMapTemp = HashMap();

  static final SensiboConnectorConjecture _instance =
      SensiboConnectorConjecture._singletonContractor();

  @override
  Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
    DeviceEntityBase entity, {
    bool fromDb = false,
  }) async =>
      HashMap()
        ..addEntries(
          [MapEntry(entity.entityCbjUniqueId.getOrCrash(), entity)],
        );
}
