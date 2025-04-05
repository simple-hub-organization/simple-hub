// import 'dart:async';
// import 'dart:collection';

// import 'package:integrations_controller/src/domain/core/request_action_types.dart';
// import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
// import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
// import 'package:integrations_controller/src/infrastructure/core/utils.dart';
// import 'package:integrations_controller/src/infrastructure/devices/esphome/esphome_helpers.dart';

// class EspHomeConnectorConjecture extends VendorConnectorConjectureService {
//   factory EspHomeConnectorConjecture() {
//     return _instance;
//   }

//   EspHomeConnectorConjecture._singletonContractor()
//       : super(
//           VendorsAndServices.espHome,
//           displayName: 'ESPHome',
//           imageUrl: 'https://i.ibb.co/W2YG23s/ESPHome-logo.png',
//           loginType: VendorLoginTypes.emailAndPassword,
//           uniqeMdnsList: ['_esphomelib._tcp'],
//         );

//   static final EspHomeConnectorConjecture _instance =
//       EspHomeConnectorConjecture._singletonContractor();

//   static String? espHomeDevicePass;

//   Map<String, DeviceEntityBase> get getAllCompanyDevices => vendorEntities;

//   @override
//   void loginEmailAndPassword(String email, String password) {
//     espHomeDevicePass = password;
//     // We can start a search of devices in node red using a request to
//     // /esphome/discovery but for now lets just let the devices get found by
//     // the global mdns search
//   }

//   @override
//   Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
//     DeviceEntityBase entity,
//   ) async {
//     if (espHomeDevicePass == null) {
//       icLogger.w('ESPHome device got found but missing a password, please add '
//           'password for it in the app');
//       return HashMap();
//     }

//     return EspHomeHelpers.addDiscoveredEntities(
//       entity: entity,
//       devicePassword: espHomeDevicePass!,
//     );
//   }
// }
