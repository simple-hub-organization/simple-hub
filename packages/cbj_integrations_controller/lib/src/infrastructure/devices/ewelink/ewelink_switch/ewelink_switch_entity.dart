import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_switch_entity/generic_switch_entity.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_switch_entity/generic_switch_value_objects.dart';
import 'package:dartz/dartz.dart';

class EwelinkSwitchEntity extends GenericSwitchDE {
  EwelinkSwitchEntity({
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
    required super.switchState,
  }) : super(
          cbjDeviceVendor: CbjDeviceVendor(VendorsAndServices.sonoffEweLink),
        );

  factory EwelinkSwitchEntity.fromGeneric(GenericSwitchDE entity) {
    return EwelinkSwitchEntity(
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
      entityCbjUniqueId: entity.entityCbjUniqueId,
      switchState: entity.switchState,
    );
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOnSwitch() async {
    switchState = GenericSwitchSwitchState(EntityActions.on.toString());
    try {
      // await EwelinkConnectorConjecture().ewelink?.setDevicePowerState(
      //       deviceId: deviceUniqueId.getOrCrash(),
      //       state: 'on',
      //       // TODO: Bug in api, channel 1 get changed no matter the input
      //       // https://github.com/ianmaciel/dart_ewelink_api/issues/21
      //       channel: entityKey.getOrCrash(),
      //     );
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffSwitch() async {
    switchState = GenericSwitchSwitchState(EntityActions.off.toString());
    try {
      // await EwelinkConnectorConjecture().ewelink?.setDevicePowerState(
      //       deviceId: deviceUniqueId.getOrCrash(),
      //       state: 'off',
      //       // TODO: Bug in api, channel 1 get changed no matter the input
      //       // https://github.com/ianmaciel/dart_ewelink_api/issues/21
      //       channel: entityKey.getOrCrash(),
      //     );
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }
}
