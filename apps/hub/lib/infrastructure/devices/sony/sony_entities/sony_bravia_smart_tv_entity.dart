import 'dart:async';
import 'dart:collection';

import 'package:dartz/dartz.dart';
import 'package:hub/infrastructure/web_socket/hub_javascript_web_socket.dart';
import 'package:integrations_controller/integrations_controller.dart';

class SonyBraviaSmartTvEntity extends GenericSmartTvDE {
  SonyBraviaSmartTvEntity({
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
  }) : super(
          cbjDeviceVendor: CbjDeviceVendor(VendorsAndServices.sony),
        );

  factory SonyBraviaSmartTvEntity.fromGeneric(GenericSmartTvDE entity) {
    return SonyBraviaSmartTvEntity(
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
      smartTvSwitchState: entity.smartTvSwitchState,
      entityCbjUniqueId: entity.entityCbjUniqueId,
    );
  }

  HashMap<ActionValues, dynamic>? getDeviceValues() {
    final HashMap<ActionValues, dynamic> map = HashMap<ActionValues, dynamic>();
    map.addEntries([
      MapEntry(ActionValues.ip, deviceLastKnownIp.getOrCrash()),
      MapEntry(ActionValues.passsword, entityKey.getOrCrash()),
      MapEntry(ActionValues.port, devicePort.getOrCrash()),
    ]);
    return map;
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOnSmartTv() async {
    wakeOnLan();
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffSmartTv() async {
    smartTvSwitchState =
        GenericSmartTvSwitchState(EntityActions.off.toString());
    try {
      final RequestActionObject action = RequestActionObject(
        entityIds: HashSet()..add(uniqueId.getOrCrash()),
        property: EntityProperties.smartTvSwitchState,
        actionType: EntityActions.off,
        vendors: HashSet()..add(VendorsAndServices.sony),
        value: getDeviceValues(),
      );
      HubJavascriptWebSocket.instance.setState(action);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> togglePausePlay() async {
    pausePlayState =
        GenericSmartTvPausePlayState(EntityActions.pausePlay.toString());
    try {
      final RequestActionObject action = RequestActionObject(
        entityIds: HashSet()..add(uniqueId.getOrCrash()),
        property: EntityProperties.smartTvSwitchState,
        actionType: EntityActions.pausePlay,
        vendors: HashSet()..add(VendorsAndServices.sony),
        value: getDeviceValues(),
      );
      HubJavascriptWebSocket.instance.setState(action);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> togglePause() async {
    pausePlayState =
        GenericSmartTvPausePlayState(EntityActions.pause.toString());
    try {
      final RequestActionObject action = RequestActionObject(
        entityIds: HashSet()..add(uniqueId.getOrCrash()),
        property: EntityProperties.smartTvSwitchState,
        actionType: EntityActions.pause,
        vendors: HashSet()..add(VendorsAndServices.sony),
        value: getDeviceValues(),
      );
      HubJavascriptWebSocket.instance.setState(action);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> togglePlay() async {
    pausePlayState =
        GenericSmartTvPausePlayState(EntityActions.play.toString());
    try {
      final RequestActionObject action = RequestActionObject(
        entityIds: HashSet()..add(uniqueId.getOrCrash()),
        property: EntityProperties.smartTvSwitchState,
        actionType: EntityActions.play,
        vendors: HashSet()..add(VendorsAndServices.sony),
        value: getDeviceValues(),
      );
      HubJavascriptWebSocket.instance.setState(action);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> toggleStop() async {
    pausePlayState =
        GenericSmartTvPausePlayState(EntityActions.stop.toString());
    try {
      final RequestActionObject action = RequestActionObject(
        entityIds: HashSet()..add(uniqueId.getOrCrash()),
        property: EntityProperties.smartTvSwitchState,
        actionType: EntityActions.stop,
        vendors: HashSet()..add(VendorsAndServices.sony),
        value: getDeviceValues(),
      );
      HubJavascriptWebSocket.instance.setState(action);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> volumeUp(double value) async {
    volume = GenericSmartTvVolume(EntityActions.volumeUp.toString());
    try {
      final RequestActionObject action = RequestActionObject(
        entityIds: HashSet()..add(uniqueId.getOrCrash()),
        property: EntityProperties.volume,
        actionType: EntityActions.volumeUp,
        vendors: HashSet()..add(VendorsAndServices.sony),
        value: getDeviceValues(),
      );
      HubJavascriptWebSocket.instance.setState(action);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> volumeDown(double value) async {
    volume = GenericSmartTvVolume(EntityActions.volumeUp.toString());
    try {
      final RequestActionObject action = RequestActionObject(
        entityIds: HashSet()..add(uniqueId.getOrCrash()),
        property: EntityProperties.volume,
        actionType: EntityActions.volumeDown,
        vendors: HashSet()..add(VendorsAndServices.sony),
        value: getDeviceValues(),
      );
      HubJavascriptWebSocket.instance.setState(action);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
    return right(unit);
  }
}
