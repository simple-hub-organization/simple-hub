import 'dart:async';

import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
// ignore: implementation_imports
import 'package:mqtt_client/src/observable/src/records.dart';

abstract class IMqttServerRepository {
  static late IMqttServerRepository instance;

  // static const String hubBaseTopic = 'CBJ_Hub_Topic';
  //
  // static const String devicesTopicTypeName = 'Devices';

  String getHubBaseTopic();

  String getNodeRedApiBaseTopic();

  String getDevicesTopicTypeName();

  String getNodeRedDevicesTopicTypeName();

  String getScenesTopicTypeName();

  String getRoutinesTopicTypeName();

  String getBindingsTopicTypeName();

  /// Connecting the hub client to broker
  Future<MqttServerClient> connect();

  /// Make sure that mqtt is connected state before continuing
  Future asyncConstructor();

  /// Stream all subscription changes
  Stream<List<MqttReceivedMessage<MqttMessage?>>> streamOfAllSubscriptions();

  /// Stream all hub subscription changes
  Stream<List<MqttReceivedMessage<MqttMessage?>>> streamOfAllHubSubscriptions();

  /// Stream all devices subscription changes
  Stream<List<MqttReceivedMessage<MqttMessage?>>>
      streamOfAllDevicesHubSubscriptions();

  /// Stream all device changes for the app
  Stream<List<MqttReceivedMessage<MqttMessage?>>>
      streamOfAllDeviceAppSubscriptions();

  /// Stream of chosen topic, example Tasmota discover new devices topic
  Stream<List<MqttReceivedMessage<MqttMessage?>>> streamOfChosenSubscription(
    String topicPath,
  );

  /// Get hub subscription and for each device change it will call method to
  /// notify the needed devices
  Future allHubDevicesSubscriptions();

  /// Send requests back to the app, from updated device state to new areas
  Future sendToApp();

  /// Publish message to a specific topic
  Future publishMessage(String topic, String message);

  /// Publish all device properties
  Future publishDeviceEntity(
    DeviceEntityBase deviceEntityDtoAbstract,
  );

  /// Read mqtt last massage in given topic
  Future<List<ChangeRecord>?> readingFromMqttOnce(String topic);

  /// Subscribe to changes in given topic
  Future subscribeToTopic(String topic);

  /// Post object from the app to the cbj hub through the mqtt, it insures that
  /// it is posted correctly, right path and right way to post each type
  Future postToHubMqtt({
    required dynamic entityFromTheApp,
    bool? gotFromApp,
  });

  /// Post object from the Hub to the app through the mqtt, it insures that
  /// it is posted correctly, right path and right way to post each type
  Future postToAppMqtt({
    required DeviceEntityBase entityFromTheHub,
  });

  /// Post smart device from the Hub to the app through the mqtt, it insures that
  /// it is posted correctly, right path and right way to post each type
  Future postSmartDeviceToAppMqtt({
    required DeviceEntityBase entityFromTheHub,
  });
}
