import 'dart:async';
import 'dart:io';

import 'package:cast/cast.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_smart_tv_entity/generic_smart_tv_entity.dart';
import 'package:dartz/dartz.dart';

class ChromeCastEntity extends GenericSmartTvDE {
  ChromeCastEntity({
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
    required super.smartTvSwitchState,
    super.pausePlayState,
    super.volume,
  }) : super(
          cbjDeviceVendor: CbjDeviceVendor(VendorsAndServices.google),
        ) {
    asyncConstructor();
  }

  factory ChromeCastEntity.fromGeneric(GenericSmartTvDE entity) {
    return ChromeCastEntity(
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
      smartTvSwitchState: entity.smartTvSwitchState,
    );
  }
  Future asyncConstructor() async {
    final String? srvTargetTemp = srvTarget.getOrCrash();

    if (srvTargetTemp != null && srvTargetTemp.isNotEmpty) {
      final String address =
          (await InternetAddress.lookup(srvTargetTemp)).first.address;
      if (address.isNotEmpty) {
        deviceLastKnownIp = DeviceLastKnownIp(value: address);
      }
    }

    castDevice = CastDevice(
      serviceName: devicesMacAddress.getOrCrash() ?? '',
      name: deviceOriginalName.getOrCrash() ?? '',
      host: deviceLastKnownIp.getOrCrash()!,
      port: int.tryParse(devicePort.getOrCrash() ?? '')!,
    );
  }

  CastDevice? castDevice;

  @override
  Future<Either<CoreFailure, Unit>> turnOnSmartTv() async => right(unit);

  @override
  Future<Either<CoreFailure, Unit>> turnOffSmartTv() async {
    await castDevice?.close();

    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> sendUrlToDevice(String url) async {
    await castDevice?.openMedia(
      url: url,
      title: 'Opened from CBJ App',
      coverImage: coverImage,
    );
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> openUrl(String url) async {
    await castDevice?.openUrl(url);
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> tts(String text) async {
    await castDevice?.tts(
      text: text,
      title: 'From CBJ App',
      coverImage: coverImage,
    );
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> togglePausePlay() async => right(unit);

  @override
  Future<Either<CoreFailure, Unit>> togglePause() async {
    await castDevice?.pauseButton();
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> togglePlay() async {
    await castDevice?.playButton();
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> toggleStop() async {
    await castDevice?.pauseButton();
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> volumeUp(double value) async {
    await castDevice?.volumeUp(value);
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> volumeDown(double value) async {
    await castDevice?.volumeDown(value);
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> openApp(OpenAppOnSmartTvEnum value) async {
    await castDevice?.launchAppId('Netflix');
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> skipBackward() async => right(unit);

  @override
  Future<Either<CoreFailure, Unit>> skipForeword() async => right(unit);

  @override
  Future<Either<CoreFailure, Unit>> closeApp() async => right(unit);
}
