import 'dart:async';
import 'dart:collection';

import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/lifx/lifx_helpers.dart';
import 'package:cbj_integrations_controller/src/infrastructure/vendors_connector_conjecture.dart';
import 'package:lifx_http_api/lifx_http_api.dart';

class LifxConnectorConjecture extends VendorConnectorConjectureService {
  factory LifxConnectorConjecture() => _instance;

  LifxConnectorConjecture._singletonContractor()
      : super(
          VendorsAndServices.lifx,
          displayName: 'Lifx',
          imageUrl:
              'https://play-lh.googleusercontent.com/k61DT9oYt_BPdzjAFokLY5e-He-YSl7-eZHeieaVO45XDAwQ6ebegsS_ZsQytca2zWM=s180',
          urlToLoginCredentials: 'https://cloud.lifx.com/',
          loginType: VendorLoginTypes.apiKey,
        );

  static final LifxConnectorConjecture _instance =
      LifxConnectorConjecture._singletonContractor();

  // TODO: Convert search from cloud into connector conjector

  @override
  Future loginApiKey(String value) async {
    lifxClient = LIFXClient(value);
    _discoverNewDevices();
  }

  LIFXClient? lifxClient;

  Future _discoverNewDevices() async {
    while (true) {
      try {
        final Iterable<LIFXBulb> lights =
            await lifxClient!.listLights(const Selector());

        for (final LIFXBulb lifxDevice in lights) {
          final HashMap<String, DeviceEntityBase> addDevice =
              LifxHelpers.addDiscoveredDevice(lifxDevice);
          for (final DeviceEntityBase entity in addDevice.values) {
            await VendorsConnectorConjecture().foundEntityOfVendor(
              vendorConnectorConjectureService: this,
              entity: entity,
              entityCbjUniqueId: entity.entityCbjUniqueId.getOrCrash(),
            );
          }
        }
        await Future.delayed(const Duration(minutes: 3));
      } catch (e) {
        icLogger.e('Error discover in Lifx\n$e');
        await Future.delayed(const Duration(minutes: 1));
      }
    }
  }

  @override
  Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
    DeviceEntityBase entity, {
    bool fromDb = false,
  }) async =>
      HashMap()..addEntries([MapEntry(entity.getCbjEntityId, entity)]);
}
