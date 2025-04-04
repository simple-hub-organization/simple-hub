import 'package:hub/infrastructure/devices/matter/matter_connector_conjecture.dart';
import 'package:hub/infrastructure/devices/sony/sony_connector_conjecture.dart';
import 'package:integrations_controller/integrations_controller.dart';

class HubVendorsConnectorConjecture extends VendorsConnectorConjecture {
  @override
  Future asyncConstructor() async {
    VendorConnectorConjectureController.instance = this;
    VendorsConnectorConjecture().asyncConstructor();
    MatterConnectorConjecture();
    SonyConnectorConjecture();
  }
}
