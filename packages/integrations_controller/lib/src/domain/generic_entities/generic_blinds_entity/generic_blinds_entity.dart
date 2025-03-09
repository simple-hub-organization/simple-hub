import 'package:dartz/dartz.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_dto_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/entity_type_utils.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_blinds_entity/generic_blinds_device_dtos.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_blinds_entity/generic_blinds_value_objects.dart';

/// Abstract smart GenericBlinds that exist inside a computer, the
/// implementations will be actual GenericBlinds like blinds blindss and more
class GenericBlindsDE extends DeviceEntityBase {
  /// All public field of GenericBlinds entity
  GenericBlindsDE({
    required super.uniqueId,
    required super.entityUniqueId,
    required super.cbjDeviceVendor,
    required super.deviceVendor,
    required super.deviceNetworkLastUpdate,
    required super.cbjEntityName,
    required super.entityOriginalName,
    required super.deviceOriginalName,
    required super.entityStateGRPC,
    required super.stateMassage,
    required super.senderDeviceOs,
    required super.senderDeviceModel,
    required super.senderId,
    required super.compUuid,
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
    required this.blindsSwitchState,
  }) : super(
          entityTypes: EntityType.type(EntityTypes.blinds),
        );

  /// Empty instance of GenericBlindsEntity
  factory GenericBlindsDE.empty() => GenericBlindsDE(
        uniqueId: CoreUniqueId(),
        entityUniqueId: EntityUniqueId(''),
        cbjEntityName: CbjEntityName(value: ''),
        entityOriginalName: EntityOriginalName(''),
        deviceOriginalName: DeviceOriginalName(value: ''),
        entityStateGRPC: EntityState.state(EntityStateGRPC.undefined),
        senderDeviceOs: DeviceSenderDeviceOs(''),
        senderDeviceModel: DeviceSenderDeviceModel(''),
        stateMassage: DeviceStateMassage(value: ''),
        senderId: DeviceSenderId(),
        cbjDeviceVendor: CbjDeviceVendor(VendorsAndServices.undefined),
        deviceVendor: DeviceVendor(),
        deviceNetworkLastUpdate: DeviceNetworkLastUpdate(),
        deviceUniqueId: DeviceUniqueId(''),
        devicePort: DevicePort(value: ''),
        deviceLastKnownIp: DeviceLastKnownIp(value: ''),
        deviceHostName: DeviceHostName(value: ''),
        deviceMdns: DeviceMdns(value: ''),
        srvResourceRecord: DeviceSrvResourceRecord(),
        mdnsServiceType: DeviceMdnsServiceType(),
        ptrResourceRecord: DevicePtrResourceRecord(),
        srvTarget: DeviceSrvTarget(),
        compUuid: DeviceCompUuid(''),
        powerConsumption: DevicePowerConsumption(''),
        devicesMacAddress: DevicesMacAddress(value: ''),
        entityKey: EntityKey(''),
        requestTimeStamp: RequestTimeStamp(''),
        lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp(''),
        entityCbjUniqueId: CoreUniqueId(),
        blindsSwitchState:
            GenericBlindsSwitchState(EntityActions.off.toString()),
      );

  /// State of the blinds on/off
  GenericBlindsSwitchState? blindsSwitchState;

  //
  // /// Will return failure if any of the fields failed or return unit if fields
  // /// have legit values
  Option<CoreFailure<dynamic>> get failureOption =>
      cbjEntityName.value.fold((f) => some(f), (_) => none());
  //
  // return body.failureOrUnit
  //     .andThen(todos.failureOrUnit)
  //     .andThen(
  //       todos
  //           .getOrCrash()
  //           // Getting the failureOption from the TodoItem ENTITY - NOT a failureOrUnit from a VALUE OBJECT
  //           .map((todoItem) => todoItem.failureOption)
  //           .filter((o) => o.isSome())
  //           // If we can't get the 0th element, the list is empty. In such a case, it's valid.
  //           .getOrElse(0, (_) => none())
  //           .fold(() => right(unit), (f) => left(f)),
  //     )
  //     .fold((f) => some(f), (_) => none());
  // }

  /// Return a list of all valid actions for this device
  @override
  List<String> getAllValidActions() {
    return GenericBlindsSwitchState.blindsValidActions();
  }

  @override
  DeviceEntityDtoBase toInfrastructure() {
    return GenericBlindsDeviceDtos(
      deviceDtoClass: (GenericBlindsDeviceDtos).toString(),
      id: uniqueId.getOrCrash(),
      entityUniqueId: entityUniqueId.getOrCrash(),
      cbjEntityName: cbjEntityName.getOrCrash(),
      entityOriginalName: entityOriginalName.getOrCrash(),
      deviceOriginalName: deviceOriginalName.getOrCrash(),
      entityStateGRPC: entityStateGRPC.getOrCrash(),
      stateMassage: stateMassage.getOrCrash(),
      senderDeviceOs: senderDeviceOs.getOrCrash(),
      senderDeviceModel: senderDeviceModel.getOrCrash(),
      senderId: senderId.getOrCrash(),
      entityTypes: entityTypes.getOrCrash(),
      compUuid: compUuid.getOrCrash(),
      blindsSwitchState: blindsSwitchState!.getOrCrash(),
      cbjDeviceVendor: cbjDeviceVendor.getOrCrash(),
      deviceVendor: deviceVendor.getOrCrash(),
      deviceNetworkLastUpdate: deviceNetworkLastUpdate.getOrCrash(),
      powerConsumption: powerConsumption.getOrCrash(),
      deviceUniqueId: deviceUniqueId.getOrCrash(),
      devicePort: devicePort.getOrCrash(),
      deviceLastKnownIp: deviceLastKnownIp.getOrCrash(),
      deviceHostName: deviceHostName.getOrCrash(),
      deviceMdns: deviceMdns.getOrCrash(),
      srvResourceRecord: srvResourceRecord.getOrCrash(),
      srvTarget: srvTarget.getOrCrash(),
      ptrResourceRecord: ptrResourceRecord.getOrCrash(),
      mdnsServiceType: mdnsServiceType.getOrCrash(),
      devicesMacAddress: devicesMacAddress.getOrCrash(),
      entityKey: entityKey.getOrCrash(),
      requestTimeStamp: requestTimeStamp.getOrCrash(),
      lastResponseFromDeviceTimeStamp:
          lastResponseFromDeviceTimeStamp.getOrCrash(),
      entityCbjUniqueId: entityCbjUniqueId.getOrCrash(),
    );
  }

  @override
  Future<Either<CoreFailure<dynamic>, Unit>> executeAction(
    EntitySingleRequest request,
  ) async {
    switch (request.action) {
      case EntityActions.moveUp:
        return moveUpBlinds();
      case EntityActions.stop:
        return stopBlinds();
      case EntityActions.moveDown:
        return moveDownBlinds();
      default:
        break;
    }

    return super.executeAction(request);
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> moveUpBlinds() async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> stopBlinds() async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> moveDownBlinds() async =>
      pleaseOverrideMessage();

  @override
  bool replaceActionIfExist(String action) {
    if (GenericBlindsSwitchState.blindsValidActions().contains(action)) {
      blindsSwitchState = GenericBlindsSwitchState(action);
      return true;
    }
    return false;
  }

  @override
  List<EntityProperties> getListOfPropertiesToChange() {
    return [
      EntityProperties.blindsSwitchState,
    ];
  }
}
