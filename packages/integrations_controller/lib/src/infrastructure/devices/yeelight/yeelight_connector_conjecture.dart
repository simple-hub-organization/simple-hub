import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:integrations_controller/src/domain/controllers/controllers.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:integrations_controller/src/infrastructure/devices/yeelight/yeelight_helpers.dart';
import 'package:yeedart/yeedart.dart';

class YeelightConnectorConjecture extends VendorConnectorConjectureService {
  factory YeelightConnectorConjecture() => _instance;

  YeelightConnectorConjecture._singletonContractor()
      : super(
          VendorsAndServices.yeelight,
          displayName: 'Yeelight',
          imageUrl:
              'https://play-lh.googleusercontent.com/bteU9OSFF9z596eUOkGgM3XpWF2-b1VsKvmwWFitaI4qMwVPmx3lS09fHFDx8-CX3Q=s180',
          uniqueIdentifierNameInMdns: ['YL'],
          mdnsList: ['_hap._tcp'],
          deviceHostNameLowerCaseList: ['yeelink'],
        ) {
    if (Platform.isAndroid) {
      searchDevices();
    }
  }

  static final YeelightConnectorConjecture _instance =
      YeelightConnectorConjecture._singletonContractor();

  Future searchDevices() async {
    await Future.delayed(const Duration(seconds: 1));

    while (true) {
      final List<DiscoveryResponse> responses = await Yeelight.discover();
      for (final DiscoveryResponse response in responses) {
        await sendNewDeviceToVendorConnectorConjecture(response);
      }
      await Future.delayed(const Duration(seconds: 10));
    }
  }

  Future sendNewDeviceToVendorConnectorConjecture(
    DiscoveryResponse response,
  ) async {
    final HashMap<String, DeviceEntityBase> enitityList =
        YeelightHelpers.addDiscoveredDeviceByYeelightResponse(response);

    if (enitityList.isEmpty) {
      return;
    }

    for (final MapEntry<String, DeviceEntityBase> entery
        in enitityList.entries) {
      await VendorConnectorConjectureController.instance.foundEntityOfVendor(
        vendorConnectorConjectureService: this,
        entity: entery.value,
        entityCbjUniqueId: entery.value.entityCbjUniqueId.getOrCrash(),
      );
    }
  }

  @override
  Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
    DeviceEntityBase entity, {
    bool fromDb = false,
  }) async {
    if (Platform.isAndroid && fromDb == false) {
      return HashMap.fromEntries([MapEntry(entity.getCbjEntityId, entity)]);
    }

    final responses = await Yeelight.discover();
    if (responses.isEmpty) {
      return HashMap();
    }

    final HashMap<String, DeviceEntityBase> enitityList = HashMap();
    for (final DiscoveryResponse yeelightDevice in responses) {
      final HashMap<String, DeviceEntityBase> addDevice =
          YeelightHelpers.addDiscoveredDevice(
        yeelightDevice: yeelightDevice,
        entity: entity,
      );
      enitityList.addAll(addDevice);
    }
    return enitityList;
  }
}
