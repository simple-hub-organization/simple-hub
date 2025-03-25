import 'package:hub/infrastructure/devices/matter/matter_connector_conjecture.dart';
import 'package:hub/infrastructure/devices/sony/sony_connector_conjecture.dart';
import 'package:integrations_controller/integrations_controller.dart';

class HubVendorsConnectorConjecture {
  factory HubVendorsConnectorConjecture() => _instance;

  HubVendorsConnectorConjecture._singletonConstructor() {
    VendorsConnectorConjecture();

    MatterConnectorConjecture();
    SonyConnectorConjecture();
  }

  static final HubVendorsConnectorConjecture _instance =
      HubVendorsConnectorConjecture._singletonConstructor();
}
