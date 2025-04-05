// import 'dart:collection';

// import 'package:integrations_controller/src/domain/core/value_objects.dart';
// import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
// import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
// import 'package:integrations_controller/src/domain/generic_entities/generic_light_entity/generic_light_value_objects.dart';
// import 'package:integrations_controller/src/domain/generic_entities/generic_switch_entity/generic_switch_value_objects.dart';
// import 'package:integrations_controller/src/infrastructure/devices/esphome/esphome_connector_conjecture.dart';
// import 'package:integrations_controller/src/infrastructure/devices/esphome/esphome_light/esphome_light_entity.dart';
// import 'package:integrations_controller/src/infrastructure/devices/esphome/esphome_switch/esphome_switch_entity.dart';
// import 'package:nodered/nodered.dart';

// class EspHomeHelpers {
//   /// Will create new espHome device node in NodeRed if does not exist.
//   /// If already exits it will check if this is the correct one for the given
//   /// device and if so will just return the existing one node id
//   static Future<String> createDeviceNodeOrReturnExistingOne({
//     required String mDnsName,
//     required String devicePassword,
//     String? espHomeNodeDeviceId,
//   }) async {
//     if (espHomeNodeDeviceId == null) {
//       /// Try to find entity that already got added that contains the same
//       /// mDNS (multiple entities can exist on the device)
//       for (final DeviceEntityBase deviceE
//           in EspHomeConnectorConjecture().getAllCompanyDevices.values) {
//         if (deviceE.deviceMdns.getOrCrash() == mDnsName) {
//           return deviceE.entityCbjUniqueId.getOrCrash();
//         }
//       }
//     }
//     final String tempEspHomeNodeDeviceId =
//         espHomeNodeDeviceId ?? UniqueId().getOrCrash();

//     await Future.delayed(const Duration(milliseconds: 800));

//     return tempEspHomeNodeDeviceId;
//   }

//   static Future<Set<EspHomeDeviceEntityObject>> retrieveOnlyNewEntities({
//     required String mDnsName,
//     required String devicePassword,
//     String? espHomeDeviceNodeId,
//   }) async {
//     /// 1. Add ESPHome Device node to node red if not given one
//     final String espHomeDeviceNodeIdResult = espHomeDeviceNodeId ??
//         await createDeviceNodeOrReturnExistingOne(
//           devicePassword: devicePassword,
//           mDnsName: mDnsName,
//         );

//     /// 2. Get all entities of this device
//     final Set<EspHomeDeviceEntityObject> allEntities =
//         await EspHomeNodeRedServerApiCalls.getEspHomeDeviceEntities(
//       espHomeDeviceNodeIdResult,
//     );

//     /// 3. Compere device entities with already added entities to retrieve
//     ///  only the new once
//     final Set<EspHomeDeviceEntityObject> tempAllEntities = {};

//     for (final EspHomeDeviceEntityObject entity in allEntities) {
//       if (!EspHomeConnectorConjecture()
//           .getAllCompanyDevices
//           .containsKey(entity.config['uniqueId'])) {
//         tempAllEntities.add(entity);
//       }
//     }
//     return tempAllEntities;
//   }

//   static Future<HashMap<String, DeviceEntityBase>> addDiscoveredEntities({
//     required DeviceEntityBase entity,
//     required String devicePassword,
//     String port = '6053',
//   }) async {
//     final String? mdnsName = entity.deviceMdns.getOrCrash();
//     if (mdnsName == null) {
//       return HashMap();
//     }

//     final String espHomeDeviceNodeId =
//         await createDeviceNodeOrReturnExistingOne(
//       devicePassword: devicePassword,
//       mDnsName: mdnsName,
//     );

//     /// Make sure we add only new entities
//     final Set<EspHomeDeviceEntityObject> entitiesList =
//         await retrieveOnlyNewEntities(
//       mDnsName: mdnsName,
//       devicePassword: devicePassword,
//       espHomeDeviceNodeId: espHomeDeviceNodeId,
//     );

//     if (entitiesList.isEmpty) {
//       return HashMap();
//     }

//     // final Set<DeviceEntityBase> deviceEntityList = {};

//     // final EspHomeNodeRedApi espHomeNodeRedApi = EspHomeNodeRedApi(
//     //   repository: getIt<NodeRedRepository>(),
//     //   nodeRedApiBaseTopic:
//     //       IMqttServerRepository.instance.getNodeRedApiBaseTopic(),
//     //   nodeRedDevicesTopic:
//     //       IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName(),
//     //   nodeRedMqttBrokerNodeName: 'Cbj NodeRed plugs Api Broker',
//     // );

//     final HashMap<String, DeviceEntityBase> addEntities = HashMap();

//     for (final EspHomeDeviceEntityObject espHomeDeviceEntityObject
//         in entitiesList) {
//       // final String flowId = UniqueId().getOrCrash();

//       final String deviceKey = espHomeDeviceEntityObject.key.toString();

//       // await espHomeNodeRedApi.setNewStateNodes(
//       //   espHomeDeviceId: espHomeDeviceNodeId,
//       //   flowId: flowId,
//       //   entityId: deviceKey,
//       // );

//       if (espHomeDeviceEntityObject.type == 'Light') {
//         // TODO: Add support for more light types, I think the type is stored in supportedColorModList
//         // final List supportedColorModList = espHomeDeviceEntityObject
//         //     .config['supportedColorModesList'] as Set<dynamic>;
//         // if (supportedColorModList.first == 1) {}
//         final String entityCbjUniqueId =
//             espHomeDeviceEntityObject.config['uniqueId'] as String;
//         final DeviceEntityBase entityTemp = EspHomeLightEntity(
//           uniqueId: entity.uniqueId,
//           entityUniqueId: EntityUniqueId(entityCbjUniqueId),
//           cbjEntityName: CbjEntityName(value: espHomeDeviceEntityObject.name),
//           entityOriginalName:
//               EntityOriginalName(espHomeDeviceEntityObject.name),
//           deviceOriginalName:
//               DeviceOriginalName(value: espHomeDeviceEntityObject.name),
//           entityStateGRPC: entity.entityStateGRPC,
//           senderDeviceOs: entity.senderDeviceOs,
//           deviceVendor: entity.deviceVendor,
//           deviceNetworkLastUpdate: entity.deviceNetworkLastUpdate,
//           senderDeviceModel: entity.senderDeviceModel,
//           senderId: entity.senderId,
//           compUuid: entity.compUuid,
//           deviceMdns: entity.deviceMdns,
//           srvResourceRecord: entity.srvResourceRecord,
//           ptrResourceRecord: entity.ptrResourceRecord,
//           deviceLastKnownIp: entity.deviceLastKnownIp,
//           stateMassage: entity.stateMassage,
//           powerConsumption: entity.powerConsumption,
//           devicePort: entity.devicePort,
//           deviceUniqueId: entity.deviceUniqueId,
//           deviceHostName: entity.deviceHostName,
//           devicesMacAddress: entity.devicesMacAddress,
//           entityKey: entity.entityKey,
//           requestTimeStamp: entity.requestTimeStamp,
//           lastResponseFromDeviceTimeStamp:
//               entity.lastResponseFromDeviceTimeStamp,
//           entityCbjUniqueId: CoreUniqueId.fromUniqueString(entityCbjUniqueId),
//           lightSwitchState: GenericLightSwitchState('on'),
//         );
//         addEntities.addEntries([MapEntry(entityCbjUniqueId, entityTemp)]);
//       } else if (espHomeDeviceEntityObject.type == 'Switch' ||
//           espHomeDeviceEntityObject.type == 'Fan' ||
//           espHomeDeviceEntityObject.type == 'Siren') {
//         final String entityCbjUniqueId =
//             espHomeDeviceEntityObject.config['uniqueId'] as String;

//         final DeviceEntityBase entityTemp = EspHomeSwitchEntity(
//           uniqueId: entity.uniqueId,
//           entityUniqueId: EntityUniqueId(entityCbjUniqueId),
//           cbjEntityName: CbjEntityName(value: espHomeDeviceEntityObject.name),
//           entityOriginalName:
//               EntityOriginalName(espHomeDeviceEntityObject.name),
//           deviceOriginalName:
//               DeviceOriginalName(value: espHomeDeviceEntityObject.name),
//           entityStateGRPC: entity.entityStateGRPC,
//           senderDeviceOs: entity.senderDeviceOs,
//           deviceVendor: entity.deviceVendor,
//           deviceNetworkLastUpdate: entity.deviceNetworkLastUpdate,
//           senderDeviceModel: entity.senderDeviceModel,
//           senderId: entity.senderId,
//           compUuid: entity.compUuid,
//           deviceMdns: entity.deviceMdns,
//           srvResourceRecord: entity.srvResourceRecord,
//           ptrResourceRecord: entity.ptrResourceRecord,
//           deviceLastKnownIp: entity.deviceLastKnownIp,
//           stateMassage: entity.stateMassage,
//           powerConsumption: entity.powerConsumption,
//           devicePort: entity.devicePort,
//           deviceUniqueId: entity.deviceUniqueId,
//           deviceHostName: entity.deviceHostName,
//           devicesMacAddress: entity.devicesMacAddress,
//           entityKey: EntityKey(deviceKey),
//           requestTimeStamp: entity.requestTimeStamp,
//           lastResponseFromDeviceTimeStamp:
//               entity.lastResponseFromDeviceTimeStamp,
//           entityCbjUniqueId: CoreUniqueId.fromUniqueString(entityCbjUniqueId),
//           switchState: GenericSwitchSwitchState('on'),
//         );
//         addEntities.addEntries([MapEntry(entityCbjUniqueId, entityTemp)]);
//       }
//     }

//     return addEntities;
//   }
// }
