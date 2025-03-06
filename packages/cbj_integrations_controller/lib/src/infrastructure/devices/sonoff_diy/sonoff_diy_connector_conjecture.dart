// import 'dart:async';
// import 'dart:collection';

// import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
// import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
// import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
// import 'package:cbj_integrations_controller/src/infrastructure/devices/sonoff_diy/sonoff_diy_helpers.dart';

// class SonoffDiyConnectorConjecture extends VendorConnectorConjectureService {
//   factory SonoffDiyConnectorConjecture() {
//     return _instance;
//   }

//   SonoffDiyConnectorConjecture._singletonContractor()
//       : super(
//           VendorsAndServices.sonoffDiy,
//           displayName: 'Sonoff',
//           imageUrl:
//               'https://play-lh.googleusercontent.com/nfDq8xm5ueWPIZswiRD8PxzjmFAmOBgByV1CpFfAhau1_D_XCP2jW0EZ3VMEtZwbVRk=s180',
//           uniqeMdnsList: ['_ewelink._tcp'],
//         );

//   static final SonoffDiyConnectorConjecture _instance =
//       SonoffDiyConnectorConjecture._singletonContractor();

//   // @override
//   // Future<HashMap<String, DeviceEntityBase>?> foundEntity(
//   //   DeviceEntityBase entity,
//   // ) async {
//   // /// Add new devices to [companyDevices] if not exist
//   // Future<List<DeviceEntityBase>> addNewDeviceByMdnsName({
//   //   required String mDnsName,
//   //   required String ip,
//   //   required String port,
//   // }) async {

//   // CoreUniqueId? tempCoreUniqueId;

//   // for (final DeviceEntityBase device in companyDevices.values) {
//   //   if (device is SonoffDiyRelaySwitchEntity &&
//   //       mDnsName == device.entityUniqueId.getOrCrash()) {
//   //     return [];
//   //   } else if (device is GenericSwitchDE &&
//   //       mDnsName == device.entityUniqueId.getOrCrash()) {
//   //     /// Device exist as generic and needs to get converted to non generic type for this vendor
//   //     tempCoreUniqueId = device.uniqueId;
//   //     break;
//   //   } else if (mDnsName == device.entityUniqueId.getOrCrash()) {
//   //     icLogger.w(
//   //       'Sonoff device type supported but implementation is missing here',
//   //     );
//   //     return [];
//   //   }
//   // }

//   // final List<DeviceEntityBase> sonoffDevices =
//   //     SonoffDiyHelpers.addDiscoveredDevice(
//   //   mDnsName: mDnsName,
//   //   ip: ip,
//   //   port: port,
//   //   uniqueDeviceId: tempCoreUniqueId,
//   // );

//   // if (sonoffDevices.isEmpty) {
//   //   return [];
//   // }

//   // for (final DeviceEntityBase entityAsDevice in sonoffDevices) {
//   //   final MapEntry<String, DeviceEntityBase> deviceAsEntry =
//   //       MapEntry(entityAsDevice.uniqueId.getOrCrash(), entityAsDevice);

//   //   companyDevices.addEntries([deviceAsEntry]);
//   // }
//   // icLogger.t('New Sonoff diy devices name:$mDnsName');
//   // return sonoffDevices;
//   // return null;
//   // }

//   @override
//   Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
//     DeviceEntityBase entity,
//   ) =>
//       SonoffDiyHelpers.addDiscoveredDevice(entity);
// }
