import 'dart:collection';

import 'package:integrations_controller/integrations_controller.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_empty_entity/generic_empty_entity.dart';

abstract class VendorConnectorConjectureController {
  static VendorConnectorConjectureController? _instance;

  static VendorConnectorConjectureController get instance {
    return _instance ??= VendorsConnectorConjecture();
  }

  static set instance(VendorConnectorConjectureController? instance) {
    _instance = instance;
  }

  Future asyncConstructor();

  List<VendorEntityInformation> getVendors();

  void loginVendor(VendorLoginEntity vendorLoginService);

  // When vendor need more information from entity it using this list
  List<DeviceEntityBase> moreInformationForEntity = [];

  /// Getting ActiveHost that contain MdnsInfo property and activate it inside
  /// The correct company.
  Future setMdnsDevice(GenericUnsupportedDE entity);

  void setUpnpDevice(GenericUnsupportedDE entity);

  Future setHostNameDeviceByCompany(GenericUnsupportedDE entity);

  Future setHostNameDeviceByPort(
    VendorsAndServices vendor,
    DeviceEntityBase entity,
  );

  Future loadEntitiesFromDb({
    required VendorConnectorConjectureService vendorConnectorConjectureService,
    required DeviceEntityBase entity,
    required String entityCbjUniqueId,
  });

  Future foundEntityOfVendor({
    required VendorConnectorConjectureService vendorConnectorConjectureService,
    required DeviceEntityBase entity,
    required String entityCbjUniqueId,
  });

  HashMap<VendorsAndServices, List<int>>? portsToScan();

  VendorConnectorConjectureService? getVendorConnectorConjecture(
    VendorsAndServices vendor,
  );

  void setEntitiesState(RequestActionObject action);

  HashMap<String, DeviceEntityBase> getEntities();

  HashMap<String, EntityTypes> getTypesForEntities(HashSet<String> entities);
}
