import 'package:hub/utils.dart';
import 'package:integrations_controller/integrations_controller.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
// ignore: implementation_imports
import 'package:mqtt_client/src/observable/src/records.dart';

class MqttServerRepository extends IMqttServerRepository {
  MqttServerRepository() {
    IMqttServerRepository.instance = this;
  }

  /// Static instance of connection to mqtt broker
  static MqttServerClient client = MqttServerClient('127.0.0.1', 'CBJ_Hub');

  static const String hubBaseTopic = 'CBJ_Hub_Topic';

  static const String appBaseTopic = 'CBJ_App_Topic';

  static const String nodeRedApiBaseTopic = 'NodeRed_Api_Topic';

  static const String devicesTopicTypeName = 'Devices';

  static const String nodeRedDevicesTopic = 'Node_Red_Devices';

  static const String scenesTopicTypeName = 'Scenes';

  static const String routinesTopicTypeName = 'Routines';

  static const String bindingsTopicTypeName = 'Bindings';

  static Future<MqttServerClient>? clientFuture;

  @override
  Future asyncConstructor() async {
    clientFuture = connect();
    await clientFuture;
  }

  @override
  String getHubBaseTopic() => hubBaseTopic;

  @override
  String getNodeRedApiBaseTopic() => nodeRedApiBaseTopic;

  @override
  String getDevicesTopicTypeName() => devicesTopicTypeName;

  @override
  String getNodeRedDevicesTopicTypeName() => nodeRedDevicesTopic;

  @override
  String getScenesTopicTypeName() => scenesTopicTypeName;

  @override
  String getRoutinesTopicTypeName() => routinesTopicTypeName;

  @override
  String getBindingsTopicTypeName() => bindingsTopicTypeName;

  /// Connect the client to mqtt if not in connecting or connected state already
  @override
  Future<MqttServerClient> connect() async {
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      return client;
    }
    // else if (client.connectionStatus!.state ==
    //     MqttConnectionState.connecting) {
    //   // await Future.delayed(const Duration(seconds: 1));
    //   // return client;
    // }
    else {
      client.disconnect();
    }

    client.logging(on: false);

    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onUnsubscribed = onUnsubscribed;
    client.onSubscribed = onSubscribed;
    client.onSubscribeFail = onSubscribeFail;
    client.pongCallback = pong;
    client.keepAlivePeriod = 60;

    final connMessage = MqttConnectMessage()
        .withClientIdentifier('Mqtt_MyClientUniqueId')
        .withWillTopic('Will topic')
        .withWillMessage('Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);

    logger.t('Client connecting');
    client.connectionMessage = connMessage;
    try {
      await client.connect();

      client.subscribe('#', MqttQos.atLeastOnce);
    } catch (e) {
      logger.e('Error in mqtt connect\n$e');
      client.disconnect();
    }

    return client;
  }

  @override
  Future subscribeToTopic(String topic) async =>
      client.subscribe(topic, MqttQos.atLeastOnce);

  @override
  Stream<List<MqttReceivedMessage<MqttMessage?>>>
      streamOfAllSubscriptions() async* {
    yield* MqttClientTopicFilter('#', client.updates).updates;
  }

  @override
  Stream<List<MqttReceivedMessage<MqttMessage?>>>
      streamOfAllHubSubscriptions() async* {
    yield* MqttClientTopicFilter('$hubBaseTopic/#', client.updates).updates;
  }

  @override
  Stream<List<MqttReceivedMessage<MqttMessage?>>>
      streamOfAllDevicesHubSubscriptions() async* {
    yield* MqttClientTopicFilter(
      '$hubBaseTopic/$devicesTopicTypeName/#',
      client.updates,
    ).updates;
  }

  @override
  Stream<List<MqttReceivedMessage<MqttMessage?>>>
      streamOfAllDeviceAppSubscriptions() async* {
    yield* MqttClientTopicFilter(
      '$appBaseTopic/$devicesTopicTypeName/#',
      client.updates,
    ).updates;
  }

  @override
  Stream<List<MqttReceivedMessage<MqttMessage?>>> streamOfChosenSubscription(
    String topicPath,
  ) async* {
    yield* MqttClientTopicFilter(topicPath, client.updates).updates;
  }

  @override
  Future allHubDevicesSubscriptions() async {
    streamOfAllDevicesHubSubscriptions().listen(
        (List<MqttReceivedMessage<MqttMessage?>> mqttPublishMessage) async {
      final String messageTopic = mqttPublishMessage[0].topic;
      final List<String> topicsSplitted = messageTopic.split('/');
      if (topicsSplitted.length < 4) {
        return;
      }
      final String deviceId = topicsSplitted[2];
      final String deviceDeviceTypeThatChanged = topicsSplitted[3];

      if (deviceDeviceTypeThatChanged == 'getValues') {
        findDeviceAndResendItToMqtt(deviceId);
        return;
      }

      // Connector().updateDevicesFromMqttDeviceChange(
      //   MapEntry(
      //     deviceId,
      //     {deviceDeviceTypeThatChanged: mqttPublishMessage[0].payload},
      //   ),
      // );
    });
  }

  @override
  Future sendToApp() async {
    streamOfAllDeviceAppSubscriptions().listen(
        (List<MqttReceivedMessage<MqttMessage?>> mqttPublishMessage) async {
      final String messageTopic = mqttPublishMessage[0].topic;
      final List<String> topicsSplitted = messageTopic.split('/');
      if (topicsSplitted.length < 4) {
        return;
      }
    });
  }

  @override
  Future publishMessage(String topic, String message) async {
    try {
      final builder = MqttClientPayloadBuilder();
      builder.addUTF8String(message);
      client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
    } catch (error) {
      logger.e('Error publishing MQTT message\n$error');
    }
  }

  @override
  Future publishDeviceEntity(DeviceEntityBase deviceEntity) async {
    final DeviceEntityDtoBase deviceAsDto = deviceEntity.toInfrastructure();

    final Map<String, String> devicePropertiesAsMqttTopicsAndValues =
        deviceEntityPropertiesToListOfTopicAndValue(deviceAsDto);

    for (final String propertyTopicAndMassage
        in devicePropertiesAsMqttTopicsAndValues.keys) {
      final MapEntry<String, String> deviceTopicAndProperty =
          MapEntry<String, String>(
        propertyTopicAndMassage,
        devicePropertiesAsMqttTopicsAndValues[propertyTopicAndMassage]!,
      );
      publishMessage(deviceTopicAndProperty.key, deviceTopicAndProperty.value);
    }
  }

  @override
  Future<List<ChangeRecord>?> readingFromMqttOnce(String topic) async {
    final MqttClientTopicFilter mqttClientTopic =
        MqttClientTopicFilter(topic, client.updates);
    mqttClientTopic.updates.asBroadcastStream();

    // myValueStream.listen((event) {
    //   logger.t(event);
    // });
    // final List<MqttReceivedMessage<MqttMessage?>> result =
    //     await myValueStream.first;
    return client
        .subscribe('$hubBaseTopic/#', MqttQos.atLeastOnce)!
        .changes
        .last;
  }

  /// Callback function for connection succeeded
  void onConnected() => logger.t('Connected');

  /// Unconnected
  void onDisconnected() => logger.t('Disconnected');

  /// subscribe to topic succeeded
  void onSubscribed(String topic) => logger.t('Subscribed topic: $topic');

  /// subscribe to topic failed
  void onSubscribeFail(String topic) => logger.t('Failed to subscribe $topic');

  /// unsubscribe succeeded
  void onUnsubscribed(String? topic) => logger.t('Unsubscribed topic: $topic');

  /// PING response received
  void pong() => logger.t('Ping response MQTT client callback invoked');

  /// Convert device entity properties to mqtt topic and massage
  Map<String, String> deviceEntityPropertiesToListOfTopicAndValue(
    DeviceEntityDtoBase deviceEntity,
  ) {
    final Map<String, dynamic> json = deviceEntity.toJson();
    final String deviceId = json['id'].toString();

    final Map<String, String> topicsAndProperties = <String, String>{};

    for (final String devicePropertyKey in json.keys) {
      if (devicePropertyKey == 'id') {
        continue;
      }
      final MapEntry<String, String> topicAndProperty =
          MapEntry<String, String>(
        '$hubBaseTopic/$devicesTopicTypeName/$deviceId/$devicePropertyKey',
        json[devicePropertyKey].toString(),
      );
      topicsAndProperties.addEntries([topicAndProperty]);
    }

    return topicsAndProperties;
  }

  /// Get saved device dto from mqtt by device id
  Future<DeviceEntityDtoBase> getDeviceDtoFromMqtt(
    String deviceId, {
    String? deviceComponentKey,
  }) async {
    String pathToDeviceTopic = '$hubBaseTopic/$devicesTopicTypeName/$deviceId';

    if (deviceComponentKey != null) {
      pathToDeviceTopic += '/$deviceComponentKey';
    }
    final List<ChangeRecord>? a =
        await readingFromMqttOnce('$pathToDeviceTopic/type');
    logger.t('This is a $a');
    return DeviceEntityDtoBase();
  }

  /// Resend the device object throw mqtt
  Future findDeviceAndResendItToMqtt(String deviceId) async {}

  @override
  Future postToHubMqtt({
    dynamic entityFromTheApp,
    bool? gotFromApp,
  }) async {}

  @override
  Future postToAppMqtt({
    required DeviceEntityBase entityFromTheHub,
  }) async {
    // if (entityFromTheHub is Map<String, dynamic>) {
    // if (entityFromTheHub['entityStateGRPC'] !=
    //         EntityStateGRPC.waitingInComp.toString() ||
    //     entityFromTheHub['entityStateGRPC'] !=
    //         EntityStateGRPC.ack.toString()) {
    //   logger.w("Hub didn't confirmed receiving the request yet");
    //   return;
    // }

    // final MapEntry<String, dynamic> deviceInMapEntry =
    //     MapEntry<String, dynamic>(
    //   entityFromTheHub.uniqueId.getOrCrash(),
    //   entityFromTheHub,
    // );

    // Connector().fromMqtt(deviceInMapEntry);

    // } else {
    //   logger.w(
    //     'Entity from Hub type ${entityFromTheHub.runtimeType} not '
    //     'support sending to MQTT for the app',
    //   );
    // }
  }

  @override
  Future postSmartDeviceToAppMqtt({
    required DeviceEntityBase entityFromTheHub,
  }) async =>
      postToAppMqtt(entityFromTheHub: entityFromTheHub);
}
