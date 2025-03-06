import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_light_entity/generic_light_entity.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_light_entity/generic_light_value_objects.dart';
import 'package:cbj_integrations_controller/src/domain/i_mqtt_server_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:nodered/nodered.dart';

class EspHomeLightEntity extends GenericLightDE {
  EspHomeLightEntity({
    required super.uniqueId,
    required super.entityUniqueId,
    required super.cbjEntityName,
    required super.entityOriginalName,
    required super.deviceOriginalName,
    required super.deviceVendor,
    required super.deviceNetworkLastUpdate,
    required super.stateMassage,
    required super.senderDeviceOs,
    required super.senderDeviceModel,
    required super.senderId,
    required super.compUuid,
    required super.entityStateGRPC,
    required super.powerConsumption,
    required super.deviceUniqueId,
    required super.devicePort,
    required super.deviceLastKnownIp,
    required super.deviceHostName,
    required super.deviceMdns,
    required super.srvResourceRecord,
    required super.srvTarget,
    required super.ptrResourceRecord,
    required super.mdnsServiceType,
    required super.devicesMacAddress,
    required super.entityKey,
    required super.requestTimeStamp,
    required super.lastResponseFromDeviceTimeStamp,
    required super.entityCbjUniqueId,
    required super.lightSwitchState,
  }) : super(
          cbjDeviceVendor: CbjDeviceVendor(VendorsAndServices.espHome),
        );

  factory EspHomeLightEntity.fromGeneric(GenericLightDE entity) {
    return EspHomeLightEntity(
      uniqueId: entity.uniqueId,
      entityUniqueId: entity.entityUniqueId,
      cbjEntityName: entity.cbjEntityName,
      entityOriginalName: entity.entityOriginalName,
      deviceOriginalName: entity.deviceOriginalName,
      deviceVendor: entity.deviceVendor,
      deviceNetworkLastUpdate: entity.deviceNetworkLastUpdate,
      stateMassage: entity.stateMassage,
      senderDeviceOs: entity.senderDeviceOs,
      senderDeviceModel: entity.senderDeviceModel,
      senderId: entity.senderId,
      compUuid: entity.compUuid,
      entityStateGRPC: entity.entityStateGRPC,
      powerConsumption: entity.powerConsumption,
      deviceUniqueId: entity.deviceUniqueId,
      devicePort: entity.devicePort,
      deviceLastKnownIp: entity.deviceLastKnownIp,
      deviceHostName: entity.deviceHostName,
      deviceMdns: entity.deviceMdns,
      srvResourceRecord: entity.srvResourceRecord,
      srvTarget: entity.srvTarget,
      ptrResourceRecord: entity.ptrResourceRecord,
      mdnsServiceType: entity.mdnsServiceType,
      devicesMacAddress: entity.devicesMacAddress,
      entityKey: entity.entityKey,
      requestTimeStamp: entity.requestTimeStamp,
      lastResponseFromDeviceTimeStamp: entity.lastResponseFromDeviceTimeStamp,
      lightSwitchState: entity.lightSwitchState,
      entityCbjUniqueId: entity.entityCbjUniqueId,
    );
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOnLight() async {
    lightSwitchState = GenericLightSwitchState(EntityActions.on.toString());
    try {
      final String nodeRedApiBaseTopic =
          IMqttServerRepository.instance.getNodeRedApiBaseTopic();

      final String nodeRedDevicesTopic =
          IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName();
      final String topic =
          '$nodeRedApiBaseTopic/$nodeRedDevicesTopic/${entityKey.getOrCrash()}/${EspHomeNodeRedApi.deviceStateProperty}/${EspHomeNodeRedApi.inputDeviceProperty}';

      IMqttServerRepository.instance
          .publishMessage(topic, """{"state":true}""");
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffLight() async {
    lightSwitchState = GenericLightSwitchState(EntityActions.off.toString());
    try {
      final String nodeRedApiBaseTopic =
          IMqttServerRepository.instance.getNodeRedApiBaseTopic();

      final String nodeRedDevicesTopic =
          IMqttServerRepository.instance.getNodeRedDevicesTopicTypeName();
      final String topic =
          '$nodeRedApiBaseTopic/$nodeRedDevicesTopic/${entityKey.getOrCrash()}/${EspHomeNodeRedApi.deviceStateProperty}/${EspHomeNodeRedApi.inputDeviceProperty}';

      IMqttServerRepository.instance
          .publishMessage(topic, """{"state":false}""");
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }
}
