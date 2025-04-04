import 'dart:async';
import 'dart:collection';

import 'package:integrations_controller/src/domain/controllers/controllers.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
import 'package:integrations_controller/src/infrastructure/devices/switcher/switcher_helpers.dart';
import 'package:switcher_dart/switcher_dart.dart';

class SwitcherConnectorConjecture extends VendorConnectorConjectureService {
  factory SwitcherConnectorConjecture() => _instance;

  SwitcherConnectorConjecture._singletonContractor()
      : super(
          VendorsAndServices.switcherSmartHome,
          displayName: 'Switcher',
          imageUrl:
              'https://play-lh.googleusercontent.com/8L6vVAT2cC78V622nxSznr7Mm_MgMsH25TopH-ZIm5HMwAHRy0qTX29FlHF6_kbBsQ=s180',
        ) {
    bindSocketSearchStream();
  }

  static final SwitcherConnectorConjecture _instance =
      SwitcherConnectorConjecture._singletonContractor();

  Future bindSocketSearchStream() async {
    await Future.delayed(const Duration(seconds: 3));
    SwitcherDiscover.discover20002Devices()
        .listen(sendNewDeviceToVendorConnectorConjecture);

    SwitcherDiscover.discover20003Devices()
        .listen(sendNewDeviceToVendorConnectorConjecture);
  }

  void sendNewDeviceToVendorConnectorConjecture(
    SwitcherApiObject switcherApiObject,
  ) {
    final DeviceEntityBase? entity =
        SwitcherHelpers.addDiscoveredDevice(switcherApiObject);
    if (entity == null) {
      return;
    }
    VendorConnectorConjectureController.instance.foundEntityOfVendor(
      vendorConnectorConjectureService: this,
      entity: entity,
      entityCbjUniqueId: entity.entityCbjUniqueId.getOrCrash(),
    );
  }

  @override
  Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
    DeviceEntityBase entity, {
    bool fromDb = false,
  }) async {
    DeviceEntityBase? entityTemp = entity;
    if (fromDb) {
      entityTemp = SwitcherHelpers.entityToType(entity);
      if (entityTemp == null) {
        return HashMap();
      }
    }
    // It is getting converted in bindSocketSearchStream
    return HashMap()
      ..addEntries(
        [MapEntry(entityTemp.entityCbjUniqueId.getOrCrash(), entityTemp)],
      );
  }
}
