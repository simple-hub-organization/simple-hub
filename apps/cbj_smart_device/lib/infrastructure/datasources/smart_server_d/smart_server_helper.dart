import 'package:cbj_integrations_controller/integrations_controller.dart';

/// Cleaner way to get grpc client types
class GrpcClientTypes {
  /// CbjDeviceStateGRPC type
  static final cbjDeviceStateGRPCType =
      CbjDeviceStateGRPC.stateNotSupported.runtimeType;

  /// CbjDeviceStateGRPC type as string
  static final cbjDeviceStateGRPCTypeString =
      cbjDeviceStateGRPCType.toString().substring(0, 1).toLowerCase() +
          cbjDeviceStateGRPCType.toString().substring(1);

  /// CbjDeviceActions type as string
  static final cbjDeviceActionsType =
      CbjDeviceActions.actionNotSupported.runtimeType;

  /// CbjDeviceActions type as string
  static final cbjDeviceActionsTypeString =
      cbjDeviceActionsType.toString().substring(0, 1).toLowerCase() +
          cbjDeviceActionsType.toString().substring(1);

  /// CbjDeviceActions type as string
  static final cbjDeviceTypesType = CbjDeviceTypes.typeNotSupported.runtimeType;

  /// CbjDeviceActions type as string
  static final cbjDeviceTypesTypeString =
      cbjDeviceTypesType.toString().substring(0, 1).toLowerCase() +
          cbjDeviceTypesType.toString().substring(1);
}
