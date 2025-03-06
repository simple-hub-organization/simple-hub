// import 'dart:async';
// import 'dart:collection';

// import 'package:integrations_controller/src/domain/core/request_action_types.dart';
// import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
// import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
// import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/vendor_connector_conjecture_service.dart';
// import 'package:integrations_controller/src/domain/generic_entities/generic_light_entity/generic_light_entity.dart';
// import 'package:integrations_controller/src/domain/i_mqtt_server_repository.dart';
// import 'package:integrations_controller/src/infrastructure/core/utils.dart';
// import 'package:integrations_controller/src/infrastructure/devices/tasmota/tasmota_mqtt/tasmota_mqtt_helpers.dart';
// import 'package:integrations_controller/src/infrastructure/devices/tasmota/tasmota_mqtt/tasmota_mqtt_led/tasmota_mqtt_led_entity.dart';

// class TasmotaMqttConnectorConjecture extends VendorConnectorConjectureService {
//   factory TasmotaMqttConnectorConjecture() {
//     return _instance;
//   }

//   TasmotaMqttConnectorConjecture._singletonContractor()
//       : super(
//           VendorsAndServices.tasmota,
//           displayName: 'Tasmota',
//           imageUrl: 'https://i.ibb.co/XZLGCRd/Tasmota-logo.png',
//           deviceHostNameLowerCase: ['tasmota'],
//         );

//   static final TasmotaMqttConnectorConjecture _instance =
//       TasmotaMqttConnectorConjecture._singletonContractor();

//   // Future addNewDeviceByHostInfo({
//   //   required ActiveHost activeHost,
//   // }) async {
//   //   String tempMqttTopic = (await activeHost.hostName)!.replaceAll('-', '_');
//   //   if (tempMqttTopic.lastIndexOf('_') != -1) {
//   //     tempMqttTopic =
//   //         tempMqttTopic.substring(0, tempMqttTopic.lastIndexOf('_'));
//   //   }
//   //   final String tasmotaMqttTopic = tempMqttTopic;
//   //
//   //   /// Make all tasmotaMqtt devices repost themselves under topic discovery
//   //   /// in the MQTT broker
//   //   IMqttServerRepository.instance
//   //       .publishMessage('cmnd/$tasmotaMqttTopic/SetOption19', '0');
//   // }

//   Future
// discoverNewDevices() async {
//     IMqttServerRepository.instance
//         .streamOfChosenSubscription('tasmota/discovery/+/config')
//         .listen((mqttPublishMessage) async {
//       final String messageTopic = mqttPublishMessage[0].topic;

//       final List<String> topicsSplitted = messageTopic.split('/');

//       final String deviceId = topicsSplitted[2];

//       bool deviceExist = false;
//       CoreUniqueId? tempCoreUniqueId;

//       for (final DeviceEntityBase savedDevice in vendorEntities.values) {
//         if (savedDevice is TasmotaMqttLedEntity &&
//             deviceId == savedDevice.entityUniqueId.getOrCrash()) {
//           deviceExist = true;
//           break;
//         } else if (savedDevice is GenericLightDE &&
//             deviceId == savedDevice.entityUniqueId.getOrCrash()) {
//           /// Device exist as generic and needs to get converted to non generic type for this vendor
//           tempCoreUniqueId = savedDevice.uniqueId;
//           break;
//         } else if (deviceId == savedDevice.entityUniqueId.getOrCrash()) {
//           icLogger.e(
//             'Tasmota Mqtt device type supported but implementation is missing here',
//           );
//           return;
//         }
//       }
//       if (deviceExist) {
//         return;
//       }

//       final DeviceEntityBase? addDevice =
//           TasmotaMqttHelpers.addDiscoveredDevice(
//         deviceChangeFromMqtt:
//             MapEntry(messageTopic, mqttPublishMessage[0].payload),
//         uniqueDeviceId: tempCoreUniqueId,
//       );

//       if (addDevice == null) {
//         return;
//       }

//       final MapEntry<String, DeviceEntityBase> deviceAsEntry =
//           MapEntry(addDevice.uniqueId.getOrCrash(), addDevice);

//       vendorEntities.addEntries([deviceAsEntry]);
//       icLogger.t('Adding Tasmota mqtt device');
//     });
//   }

//   @override
//   Future<HashMap<String, DeviceEntityBase>> newEntityToVendorDevice(
//     DeviceEntityBase entity,
//   ) async =>
//       HashMap();
// }
