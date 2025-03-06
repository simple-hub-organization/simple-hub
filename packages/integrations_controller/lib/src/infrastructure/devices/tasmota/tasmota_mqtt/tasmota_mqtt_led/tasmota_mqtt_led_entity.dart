import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_light_entity/generic_light_entity.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_light_entity/generic_light_value_objects.dart';
import 'package:integrations_controller/src/domain/i_mqtt_server_repository.dart';
import 'package:integrations_controller/src/infrastructure/devices/tasmota/tasmota_mqtt/tasmota_mqtt_device_value_objects.dart';
import 'package:dartz/dartz.dart';

class TasmotaMqttLedEntity extends GenericLightDE {
  TasmotaMqttLedEntity({
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
    required this.tasmotaMqttDeviceTopicName,
  }) : super(
          cbjDeviceVendor: CbjDeviceVendor(VendorsAndServices.tasmota),
        );

  TasmotaMqttDeviceTopicName tasmotaMqttDeviceTopicName;

  @override
  Future<Either<CoreFailure, Unit>> turnOnLight() async {
    lightSwitchState = GenericLightSwitchState(EntityActions.on.toString());

    try {
      IMqttServerRepository.instance.publishMessage(
        'cmnd/${tasmotaMqttDeviceTopicName.getOrCrash()}/Power',
        'ON',
      );
      return right(unit);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffLight() async {
    lightSwitchState = GenericLightSwitchState(EntityActions.off.toString());

    try {
      IMqttServerRepository.instance.publishMessage(
        'cmnd/${tasmotaMqttDeviceTopicName.getOrCrash()}/Power',
        'OFF',
      );
      return right(unit);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
  }
}
