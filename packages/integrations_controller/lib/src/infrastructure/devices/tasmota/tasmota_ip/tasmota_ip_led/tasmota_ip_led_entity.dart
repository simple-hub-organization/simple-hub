// import 'package:integrations_controller/src/domain/core/request_action_types.dart';
// import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
// import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
// import 'package:integrations_controller/src/domain/generic_entities/generic_light_entity/generic_light_entity.dart';
// import 'package:integrations_controller/src/domain/generic_entities/generic_light_entity/generic_light_value_objects.dart';
// import 'package:dartz/dartz.dart';

// // TODO: Make the commends work, currently this object does not work
// // Toggle device on/off, the o is the number of output to toggle o=2 is the second
// //    http://ip/?m=1&o=1
// // Change brightness
// //    http://ip/?m=1&d0=30
// // Change color
// //    http://ip/?m=1&h0=232
// // Change tint (I think)
// //    http://ip/?m=1&t0=500
// // Change color strength
// //    http://ip/?m=1&n0=87

// class TasmotaIpLedEntity extends GenericLightDE {
//   TasmotaIpLedEntity({
//     required super.uniqueId,
//     required super.entityUniqueId,
//     required super.cbjEntityName,
//     required super.entityOriginalName,
//     required super.deviceOriginalName,
//     required super.deviceVendor,
//     required super.deviceNetworkLastUpdate,
//     required super.stateMassage,
//     required super.senderDeviceOs,
//     required super.senderDeviceModel,
//     required super.senderId,
//     required super.compUuid,
//     required super.entityStateGRPC,
//     required super.powerConsumption,
//     required super.deviceUniqueId,
//     required super.devicePort,
//     required super.deviceLastKnownIp,
//     required super.deviceHostName,
//     required super.deviceMdns,
//     required super.srvResourceRecord,
//     required super.ptrResourceRecord,
//     required super.devicesMacAddress,
//     required super.entityKey,
//     required super.requestTimeStamp,
//     required super.lastResponseFromDeviceTimeStamp,
//     required super.entityCbjUniqueId,
//     required super.lightSwitchState,
//   }) : super(
//           cbjDeviceVendor: CbjDeviceVendor(VendorsAndServices.tasmota),
//         );

//   factory TasmotaIpLedEntity.fromGeneric(GenericLightDE genericDevice) {
//     return TasmotaIpLedEntity(
//       uniqueId: genericDevice.uniqueId,
//       entityUniqueId: genericDevice.entityUniqueId,
//       cbjEntityName: genericDevice.cbjEntityName,
//       entityOriginalName: genericDevice.entityOriginalName,
//       deviceOriginalName: genericDevice.deviceOriginalName,
//       deviceVendor: genericDevice.deviceVendor,
//       deviceNetworkLastUpdate: genericDevice.deviceNetworkLastUpdate,
//       stateMassage: genericDevice.stateMassage,
//       senderDeviceOs: genericDevice.senderDeviceOs,
//       senderDeviceModel: genericDevice.senderDeviceModel,
//       senderId: genericDevice.senderId,
//       compUuid: genericDevice.compUuid,
//       entityStateGRPC: genericDevice.entityStateGRPC,
//       powerConsumption: genericDevice.powerConsumption,
//       deviceUniqueId: genericDevice.deviceUniqueId,
//       devicePort: genericDevice.devicePort,
//       deviceLastKnownIp: genericDevice.deviceLastKnownIp,
//       deviceHostName: genericDevice.deviceHostName,
//       deviceMdns: genericDevice.deviceMdns,
//       srvResourceRecord: genericDevice.srvResourceRecord,
//       ptrResourceRecord: genericDevice.ptrResourceRecord,
//       devicesMacAddress: genericDevice.devicesMacAddress,
//       entityKey: genericDevice.entityKey,
//       requestTimeStamp: genericDevice.requestTimeStamp,
//       lastResponseFromDeviceTimeStamp:
//           genericDevice.lastResponseFromDeviceTimeStamp,
//       lightSwitchState: genericDevice.lightSwitchState,
//       entityCbjUniqueId: genericDevice.entityCbjUniqueId,
//     );
//   }

//   @override
//   Future<Either<CoreFailure, Unit>> turnOnLight() async {
//     lightSwitchState = GenericLightSwitchState(EntityActions.on.toString());

//     try {
//       IMqttServerRepository.instance.publishMessage(
//         'cmnd/${deviceHostName.getOrCrash()}/Power',
//         'ON',
//       );
//       return right(unit);
//     } catch (e) {
//       return left(const CoreFailure.unexpected());
//     }
//   }

//   @override
//   Future<Either<CoreFailure, Unit>> turnOffLight() async {
//     lightSwitchState = GenericLightSwitchState(EntityActions.off.toString());

//     try {
//       IMqttServerRepository.instance.publishMessage(
//         'cmnd/${deviceHostName.getOrCrash()}/Power',
//         'OFF',
//       );
//       return right(unit);
//     } catch (e) {
//       return left(const CoreFailure.unexpected());
//     }
//   }
// }
