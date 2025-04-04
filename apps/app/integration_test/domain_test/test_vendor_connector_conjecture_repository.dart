import 'dart:collection';

import 'package:integrations_controller/integrations_controller.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_empty_entity/generic_empty_entity.dart';

class TestVendorConnectorConjectureRepository
    extends VendorConnectorConjectureController {
  @override
  Future asyncConstructor() async =>
      VendorConnectorConjectureController.instance = this;

  @override
  Future foundEntityOfVendor(
      {required VendorConnectorConjectureService
          vendorConnectorConjectureService,
      required DeviceEntityBase entity,
      required String entityCbjUniqueId}) async {}

  @override
  HashMap<String, DeviceEntityBase> getEntities() => HashMap();

  @override
  HashMap<String, EntityTypes> getTypesForEntities(HashSet<String> entities) =>
      HashMap();

  @override
  VendorConnectorConjectureService? getVendorConnectorConjecture(
          VendorsAndServices vendor) =>
      null;

  @override
  List<VendorEntityInformation> getVendors() => [];

  @override
  Future loadEntitiesFromDb(
      {required VendorConnectorConjectureService
          vendorConnectorConjectureService,
      required DeviceEntityBase entity,
      required String entityCbjUniqueId}) async {}

  @override
  void loginVendor(VendorLoginEntity vendorLoginService) {}

  @override
  HashMap<VendorsAndServices, List<int>>? portsToScan() => null;

  @override
  void setEntitiesState(RequestActionObject action) {}

  @override
  Future setHostNameDeviceByCompany(GenericUnsupportedDE entity) async {}

  @override
  Future setHostNameDeviceByPort(
      VendorsAndServices vendor, DeviceEntityBase entity) async {}

  @override
  Future setMdnsDevice(GenericUnsupportedDE entity) async {}

  @override
  void setUpnpDevice(GenericUnsupportedDE entity) {}
}
