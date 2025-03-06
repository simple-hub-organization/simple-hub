import 'dart:async';

import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_dimmable_light_entity/generic_dimmable_light_entity.dart';
import 'package:integrations_controller/src/infrastructure/devices/philips_hue/philips_hue_api/philips_hue_api_light.dart';
import 'package:dartz/dartz.dart';

class PhilipsHueE26Entity extends GenericDimmableLightDE {
  PhilipsHueE26Entity({
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
    required super.lightBrightness,
    required this.philipsHueApiLight,
  }) : super(
          cbjDeviceVendor: CbjDeviceVendor(VendorsAndServices.philipsHue),
        );

  factory PhilipsHueE26Entity.fromGeneric(
    GenericDimmableLightDE entity,
  ) {
    return PhilipsHueE26Entity(
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
      lightBrightness: entity.lightBrightness,

      /// TODO: Save and pull philips hub generated user name
      /// (created in phillips_hue_helpers.dart)
      philipsHueApiLight: PhilipsHueApiLight(
        ipAdress: entity.deviceLastKnownIp.getOrCrash()!,
        username: '',
      ),
    );
  }

  PhilipsHueApiLight philipsHueApiLight;

  @override
  Future<Either<CoreFailure, Unit>> turnOnLight() async {
    try {
      await philipsHueApiLight.turnLightOn(entityUniqueId.getOrCrash());

      return right(unit);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffLight() async {
    try {
      await philipsHueApiLight.turnLightOff(entityUniqueId.getOrCrash());

      return right(unit);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> setBrightness(int value) async {
    try {
      await philipsHueApiLight.setLightBrightness(
        entityUniqueId.getOrCrash(),
        value,
      );

      return right(unit);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
  }
}
