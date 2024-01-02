import 'dart:convert';

import 'package:cbj_integrations_controller/domain/core/request_types.dart';
import 'package:cbj_integrations_controller/domain/i_mqtt_server_repository.dart';
import 'package:cbj_integrations_controller/infrastructure/area/area_entity_dtos.dart';
import 'package:cbj_integrations_controller/infrastructure/devices/device_helper/device_helper.dart';
import 'package:cbj_integrations_controller/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/device_entity_dto_base.dart';
import 'package:cbj_integrations_controller/infrastructure/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/infrastructure/hub_client/hub_client.dart';
import 'package:cybearjinni/infrastructure/core/logger.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
// ignore: implementation_imports
import 'package:mqtt_client/src/observable/src/records.dart';

class MqttServerRepository extends IMqttServerRepository {
  MqttServerRepository() {
    IMqttServerRepository.instance = this;
  }

  @override
  Future<void> allHubDevicesSubscriptions() async {}

  @override
  Future<void> asyncConstructor() async {}

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
  Future<void> postSmartDeviceToAppMqtt({
    required DeviceEntityBase entityFromTheHub,
  }) async {
    HubRequestsToApp.streamRequestsToApp.sink.add(
      RequestsAndStatusFromHub(
        sendingType: SendingType.entityType,
        allRemoteCommands:
            DeviceHelper.convertDomainToJsonString(entityFromTheHub),
      ),
    );
  }

  @override
  Future<void> postToAppMqtt({
    required DeviceEntityBase entityFromTheHub,
  }) async {}

  @override
  Future<void> postToHubMqtt({
    required dynamic entityFromTheApp,
    bool? gotFromApp,
  }) async {
    if (entityFromTheApp is DeviceEntityDtoBase) {
      final DeviceEntityBase deviceEntityBase = entityFromTheApp.toDomain();
      deviceEntityBase.entityStateGRPC =
          EntityState.state(EntityStateGRPC.waitingInComp);

      /// Sends directly to device connector conjecture
      // ISavedDevicesRepo.instance.addOrUpdateFromMqtt(deviceEntityBase);

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
      HubRequestsToApp.streamRequestsToApp.add(
        RequestsAndStatusFromHub(
          sendingType: SendingType.areaType,
          allRemoteCommands: jsonEncode(entityFromTheApp.toJson()),
        ),
      );
      return;
    }
    logger.i('Type interaction support is missing $entityFromTheApp');
  }

  @override
  Future<void> publishDeviceEntity(
    DeviceEntityBase deviceEntityDtoAbstract,
  ) async {}

  @override
  Future<void> publishMessage(String topic, String message) async {}

  @override
  Future<List<ChangeRecord>?> readingFromMqttOnce(String topic) async {
    return null;
  }

  @override
  Future<void> sendToApp() async {}

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
  Future<void> subscribeToTopic(String topic) async {}
}
