// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/infrastructure/core/logger.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
// ignore: implementation_imports a
import 'package:mqtt_client/src/observable/src/records.dart';

class MqttServerRepository extends IMqttServerRepository {
  MqttServerRepository() {
    IMqttServerRepository.instance = this;
  }

  @override
  Future allHubDevicesSubscriptions() async {}

  @override
  Future asyncConstructor() async {}

  @override
  Future<MqttServerClient> connect() async {
    return MqttServerClient('', '');
  }

  @override
  String getBindingsTopicTypeName() => '';

  @override
  String getDevicesTopicTypeName() => '';

  @override
  String getHubBaseTopic() => '';

  @override
  String getNodeRedApiBaseTopic() => '';

  @override
  String getNodeRedDevicesTopicTypeName() => '';

  @override
  String getRoutinesTopicTypeName() => '';

  @override
  String getScenesTopicTypeName() => '';

  @override
  Future postSmartDeviceToAppMqtt({
    required DeviceEntityBase entityFromTheHub,
  }) async {
    // HubRequestsToApp.streamRequestsToApp.sink.add(
    //   RequestsAndStatusFromHub(
    //     sendingType: SendingType.entityType.name,
    //     allRemoteCommands:
    //         DeviceHelper.convertDomainToJsonString(entityFromTheHub),
    //   ),
    // );
  }

  @override
  Future postToAppMqtt({
    required DeviceEntityBase entityFromTheHub,
  }) async {}

  @override
  Future postToHubMqtt({
    required dynamic entityFromTheApp,
    bool? gotFromApp,
  }) async {
    if (entityFromTheApp is DeviceEntityDtoBase) {
      final DeviceEntityBase deviceEntityBase = entityFromTheApp.toDomain();
      deviceEntityBase.entityStateGRPC =
          EntityState.state(EntityStateGRPC.waitingInComp);
      return;
    } else if (entityFromTheApp is DeviceEntityBase) {
      entityFromTheApp.entityStateGRPC =
          EntityState.state(EntityStateGRPC.waitingInComp);

      /// Sends directly to device connector conjecture
      // ConnectorDevicesStreamFromMqtt.fromMqttStream.add(entityFromTheApp);
    } else if (entityFromTheApp is AreaEntityDtos) {
      logger.i('Loop?');
      // ISavedAreasRepo.instance.addOrUpdateArea(entityFromTheApp.toDomain());

      /// Sends directly to device connector conjecture
      // HubRequestsToApp.streamRequestsToApp.add(
      //   RequestsAndStatusFromHub(
      //     sendingType: SendingType.areaType.name,
      //     allRemoteCommands: jsonEncode(entityFromTheApp.toJson()),
      //   ),
      // );
      return;
    }
    logger.i('Type interaction support is missing $entityFromTheApp');
  }

  @override
  Future publishDeviceEntity(
    DeviceEntityBase deviceEntityDtoAbstract,
  ) async {}

  @override
  Future publishMessage(String topic, String message) async {}

  @override
  Future<List<ChangeRecord>?> readingFromMqttOnce(String topic) async {
    return null;
  }

  @override
  Future sendToApp() async {}

  @override
  Stream<List<MqttReceivedMessage<MqttMessage?>>>
      streamOfAllDeviceAppSubscriptions() {
    // TODO: implement streamOfAllDeviceAppSubscriptions
    throw UnimplementedError();
  }

  @override
  Stream<List<MqttReceivedMessage<MqttMessage?>>>
      streamOfAllDevicesHubSubscriptions() {
    // TODO: implement streamOfAllDevicesHubSubscriptions
    throw UnimplementedError();
  }

  @override
  Stream<List<MqttReceivedMessage<MqttMessage?>>>
      streamOfAllHubSubscriptions() {
    // TODO: implement streamOfAllHubSubscriptions
    throw UnimplementedError();
  }

  @override
  Stream<List<MqttReceivedMessage<MqttMessage?>>> streamOfAllSubscriptions() {
    // TODO: implement streamOfAllSubscriptions
    throw UnimplementedError();
  }

  @override
  Stream<List<MqttReceivedMessage<MqttMessage?>>> streamOfChosenSubscription(
    String topicPath,
  ) {
    // TODO: implement streamOfChosenSubscription
    throw UnimplementedError();
  }

  @override
  Future subscribeToTopic(String topic) async {}
}
