import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_entity.dart';
import 'package:yeedart/yeedart.dart';

class XiaomiIoGpx4021GlEntity extends GenericRgbwLightDE {
  XiaomiIoGpx4021GlEntity({
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
    required super.lightColorTemperature,
    required super.lightColorAlpha,
    required super.lightColorHue,
    required super.lightColorSaturation,
    required super.lightColorValue,
    required super.lightBrightness,
    required super.colorMode,
  }) : super(
          cbjDeviceVendor: CbjDeviceVendor(VendorsAndServices.xiaomi),
        );

  factory XiaomiIoGpx4021GlEntity.fromGeneric(
    GenericRgbwLightDE entity,
  ) {
    return XiaomiIoGpx4021GlEntity(
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
      lightColorTemperature: entity.lightColorTemperature,
      lightColorAlpha: entity.lightColorAlpha,
      lightColorHue: entity.lightColorHue,
      lightColorSaturation: entity.lightColorSaturation,
      lightColorValue: entity.lightColorValue,
      colorMode: entity.colorMode,
    );
  }

  /// XiaomiIo package object require to close previews request before new one
  Device? xiaomiIoPackageObject;

  @override
  Future<Either<CoreFailure, Unit>> turnOnLight() async {
    try {
      return left(const CoreFailure.unexpected());
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffLight() async {
    try {
      return left(const CoreFailure.unexpected());
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> setBrightness(int value) async =>
      pleaseOverrideMessage();

  @override
  Future<Either<CoreFailure, Unit>> changeColorTemperature(
    int lightColorTemperatureNewValue,
  ) async =>
      pleaseOverrideMessage();

  @override
  Future<Either<CoreFailure, Unit>> changeColorHsv({
    required double value,
    required double hue,
    required double saturation,
    required double alpha,
    Duration? transitionDuration,
  }) async =>
      pleaseOverrideMessage();
}
