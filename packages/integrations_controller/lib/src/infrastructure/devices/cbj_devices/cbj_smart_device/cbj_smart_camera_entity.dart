import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_security_camera_entity/generic_security_camera_entity.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_security_camera_entity/generic_security_camera_value_objects.dart';
import 'package:integrations_controller/src/infrastructure/devices/cbj_devices/cbj_smart_device_client/cbj_smart_device_client.dart';
import 'package:dartz/dartz.dart';

class CbjSecurityCameraEntity extends GenericSecurityCameraDE {
  CbjSecurityCameraEntity({
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
    required super.securityCameraSuspendState,
  }) : super(
          cbjDeviceVendor:
              CbjDeviceVendor(VendorsAndServices.cyBearJinniAppSmartEntity),
        );

  factory CbjSecurityCameraEntity.fromGeneric(
    GenericSecurityCameraDE entity,
  ) {
    return CbjSecurityCameraEntity(
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
      securityCameraSuspendState: entity.securityCameraSuspendState,
    );
  }

  /// Please override the following methods
  @override
  Future<Either<CoreFailure, Unit>> suspendSecurityCamera() async {
    securityCameraSuspendState =
        GenericSecurityCameraSuspendState(EntityActions.itIsFalse.toString());

    await CbjSmartDeviceClient.suspendCbjSmartDeviceHostDevice(
      deviceLastKnownIp.getOrCrash()!,
      entityUniqueId.getOrCrash(),
    );

    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }

  /// Please override the following methods
  @override
  Future<Either<CoreFailure, Unit>> shutDownSecurityCamera() async {
    await CbjSmartDeviceClient.shutDownCbjSmartDeviceHostDevice(
      deviceLastKnownIp.getOrCrash()!,
      entityUniqueId.getOrCrash(),
    );

    return left(
      const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist',
      ),
    );
  }
}
