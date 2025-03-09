import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_entity.dart';
import 'package:integrations_controller/src/infrastructure/core/utils.dart';
import 'package:yeedart/yeedart.dart';

class Yeelight1SeEntity extends GenericRgbwLightDE {
  Yeelight1SeEntity({
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
          cbjDeviceVendor: CbjDeviceVendor(VendorsAndServices.yeelight),
        ) {
    minDurationBetweenRequsts = const Duration(milliseconds: 400);
    maxRequestsStack = 3;
    final String? port = devicePort.getOrCrash();
    if (port == null) {
      return;
    }
    api = Device(
      address: InternetAddress(deviceLastKnownIp.getOrCrash()!),
      port: int.parse(port),
    );
  }

  factory Yeelight1SeEntity.fromGeneric(GenericRgbwLightDE entity) {
    return Yeelight1SeEntity(
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

  /// Yeelight package object require to close previews request before new one
  late Device api;

  /// Fix to differentiate what value to change
  String? lightColorTemperatureLastValue;

  /// Fix to differentiate what value to change
  String? lightColorHueLastValue;

  /// Fix to differentiate what value to change
  String? lightColorSaturationLastValue;

  String? lightBrightnessLastValue;

  final Duration effectDuration = const Duration(milliseconds: 100);

  @override
  Future<Either<CoreFailure, Unit>> turnOnLight() async {
    try {
      await api.turnOn();

      return right(unit);
    } catch (e) {
      icLogger.e('Error in Yeelight Device setting turn on\n$e');

      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffLight() async {
    try {
      await api.turnOff();

      return right(unit);
    } catch (e) {
      return left(CoreFailure.actionExcecuter(failedValue: e));
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> setBrightness(int value) async {
    try {
      await api.setBrightness(
        brightness: value,
        duration: effectDuration,
      );

      return right(unit);
    } catch (e) {
      icLogger.e('Error in Yeelight Device setting brightness\n$e');

      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> changeColorTemperature(
    int temperature,
  ) async {
    try {
      int temperatureInt = temperature;
      if (temperatureInt < 1700) {
        temperatureInt = 1700;
      } else if (temperatureInt > 6500) {
        temperatureInt = 6500;
      }
      try {
        await api.setColorTemperature(
          colorTemperature: temperatureInt,
          duration: effectDuration,
        );
      } catch (e) {
        icLogger.e('Error in Yeelight Device setting turn on\n$e');

        return left(const CoreFailure.unexpected());
      }

      return right(unit);
    } catch (e) {
      icLogger.e('Error in Yeelight Device setting color temprature\n$e');

      return left(const CoreFailure.unexpected());
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> changeColorHsv({
    required double value,
    required double hue,
    required double saturation,
    required double alpha,
    Duration? transitionDuration,
  }) async {
    try {
      await api.setHSV(
        hue: hue.toInt(),
        saturation: decimalToPercentage(saturation),
        duration: transitionDuration ?? effectDuration,
      );
      return right(unit);
    } catch (e) {
      icLogger.e('Error in Yeelight Device setting color hue\n$e');

      return left(const CoreFailure.unexpected());
    }
  }
}
