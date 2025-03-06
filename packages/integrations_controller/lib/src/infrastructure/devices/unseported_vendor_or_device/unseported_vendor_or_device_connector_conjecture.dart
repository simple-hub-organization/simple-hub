import 'dart:collection';

import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';

class UnseportedVendorOrDeviceConnectorConjecture
    extends VendorConnectorConjectureService {
  factory UnseportedVendorOrDeviceConnectorConjecture() => _instance;

  UnseportedVendorOrDeviceConnectorConjecture._singletonContractor()
      : super(
          VendorsAndServices.undefined,
          displayName: 'Unseported vendor',
          imageUrl:
              'http://www.clker.com/cliparts/f/Z/G/4/h/Q/no-image-available-th.png',
        );

  static final UnseportedVendorOrDeviceConnectorConjecture _instance =
      UnseportedVendorOrDeviceConnectorConjecture._singletonContractor();

  @override
  Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
    DeviceEntityBase entity, {
    bool fromDb = false,
  }) async =>
      HashMap()
        ..addEntries([
          MapEntry(entity.entityCbjUniqueId.getOrCrash(), entity),
        ]);
}
