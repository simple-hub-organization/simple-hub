import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_light_entity/generic_light_entity.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_light_entity/generic_light_value_objects.dart';
import 'package:integrations_controller/src/infrastructure/devices/wiz/wiz_device_value_objects.dart';

class WizWhiteEntity extends GenericLightDE {
  WizWhiteEntity({
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
          cbjDeviceVendor: CbjDeviceVendor(VendorsAndServices.wiz),
        );

  WizPort? wizPort;

  @override
  Future<Either<CoreFailure, Unit>> turnOnLight() async {
    lightSwitchState = GenericLightSwitchState(EntityActions.on.toString());
    try {
      // final setStateBodyResponse =
      //     await WizConnectorConjecture.wizClient?.setState(
      //   // Selector.id(entityUniqueId.getOrCrash()),
      //   power: 'on',
      //   fast: true,
      // );
      // if (setStateBodyResponse == null) {
      //   throw 'setStateBodyResponse is null';
      // }
      //
      // return right(unit);
    } catch (e) {
      // As we are using the fast = true the response is always
      // WizHttpException Error
      return left(const CoreFailure.unexpected());
    }
    return left(const CoreFailure.unexpected());
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffLight() async {
    lightSwitchState = GenericLightSwitchState(EntityActions.off.toString());

    try {
      // final setStateBodyResponse =
      //     await WizConnectorConjecture.wizClient?.setState(
      // Selector.id(entityUniqueId.getOrCrash()),
      //   power: 'off',
      //   fast: true,
      // );
      // if (setStateBodyResponse == null) {
      //   throw 'setStateBodyResponse is null';
      // }
      // return right(unit);
    } catch (e) {
      // As we are using the fast = true the response is always
      // WizHttpException Error
      return left(const CoreFailure.unexpected());
    }
    return left(const CoreFailure.unexpected());
  }
}
