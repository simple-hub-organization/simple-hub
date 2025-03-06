import 'package:cbj_hub/infrastructure/devices/matter/matter_connector_conjecture.dart';
import 'package:cbj_integrations_controller/integrations_controller.dart';

class HubVendorsConnectorConjecture {
  factory HubVendorsConnectorConjecture() => _instance;

  HubVendorsConnectorConjecture._singletonConstructor() {
    VendorsConnectorConjecture();

    MatterConnectorConjecture();
  }

  static final HubVendorsConnectorConjecture _instance =
      HubVendorsConnectorConjecture._singletonConstructor();
}
