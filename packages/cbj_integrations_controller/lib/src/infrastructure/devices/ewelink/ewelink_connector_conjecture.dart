// import 'dart:async';
// import 'dart:collection';

// import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
// import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
// import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
// import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
// import 'package:cbj_integrations_controller/src/infrastructure/devices/ewelink/ewelink_helpers.dart';
// import 'package:dart_ewelink_api/dart_ewelink_api.dart';

// class EwelinkConnectorConjecture extends VendorConnectorConjectureService {
//   factory EwelinkConnectorConjecture() {
//     return _instance;
//   }

//   EwelinkConnectorConjecture._singletonContractor()
//       : super(
//           VendorsAndServices.sonoffEweLink,
//           displayName: 'Sonoff eWeLink',
//           imageUrl:
//               'https://play-lh.googleusercontent.com/nfDq8xm5ueWPIZswiRD8PxzjmFAmOBgByV1CpFfAhau1_D_XCP2jW0EZ3VMEtZwbVRk=s180',
//           loginType: VendorLoginTypes.emailAndPassword,
//           uniqeMdnsList: ['_ewelink._tcp'],
//         );

//   static final EwelinkConnectorConjecture _instance =
//       EwelinkConnectorConjecture._singletonContractor();

//   Ewelink? ewelink;

//   @override
//   Future loginEmailAndPassword(String email, String password) async {
//     try {
//       // region: cn/as/us/eu
//       ewelink = Ewelink.fromPassword(
//         region: 'us',
//         email: email,
//         password: password,
//       );

//       await ewelink!.getCredentials();
//       // Getting EweLink error: EwelinkGenericException: Sign:oauthClient enable invalid
//     } on EwelinkInvalidAccessToken {
//       icLogger.e('invalid access token');
//       return false;
//     } on EwelinkOfflineDeviceException {
//       icLogger.e('Entity is offline');
//       return false;
//     } catch (e) {
//       icLogger.e('EweLink error: $e');
//       return false;
//     }
//     return true;
//   }

//   Future waitUntilConnectionEstablished(int executed) async {
//     if (executed > 20 || ewelink != null) {
//       await Future.delayed(const Duration(seconds: 50));
//       return;
//     }
//     await Future.delayed(const Duration(seconds: 20));
//     return waitUntilConnectionEstablished(executed + 1);
//   }

//   @override
//   Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
//     DeviceEntityBase entity,
//   ) async {
//     if (ewelink == null) {
//       return HashMap();
//     }

//     List<EwelinkDevice> devices;
//     try {
//       devices = await ewelink!.getDevices();
//     } catch (e) {
//       return HashMap();
//     }

//     final HashMap<String, DeviceEntityBase> entityList = HashMap();
//     for (final EwelinkDevice ewelinkDevice in devices) {
//       // Getting device by id adds additional info in the result
//       final EwelinkDevice ewelinkDeviceWithTag =
//           await ewelink!.getDevice(deviceId: ewelinkDevice.deviceid);

//       entityList
//           .addAll(EwelinkHelpers.addDiscoveredDevice(ewelinkDeviceWithTag));
//     }
//     return entityList;
//   }
// }
