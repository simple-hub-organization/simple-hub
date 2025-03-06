import 'package:cbj_integrations_controller/src/domain/core/request_action_types.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/generic_ac_entity/generic_ac_entity.dart';
import 'package:cbj_integrations_controller/src/infrastructure/devices/sensibo/sensibo_connector_conjecture.dart';
import 'package:dartz/dartz.dart';
import 'package:sensibo/sensibo.dart';

class SensiboSkyEntity extends GenericAcDE {
  SensiboSkyEntity({
    required super.uniqueId,
    required super.entityUniqueId,
    required super.cbjEntityName,
    required super.stateMassage,
    required super.senderDeviceOs,
    required super.senderDeviceModel,
    required super.senderId,
    required super.compUuid,
    required super.entityStateGRPC,
    required super.entityOriginalName,
    required super.deviceOriginalName,
    required super.powerConsumption,
    required super.deviceUniqueId,
    required super.devicePort,
    required super.deviceLastKnownIp,
    required super.deviceHostName,
    required super.deviceMdns,
    required super.devicesMacAddress,
    required super.entityKey,
    required super.requestTimeStamp,
    required super.lastResponseFromDeviceTimeStamp,
    required super.entityCbjUniqueId,
    required super.srvResourceRecord,
    required super.srvTarget,
    required super.ptrResourceRecord,
    required super.mdnsServiceType,
    required super.deviceVendor,
    required super.deviceNetworkLastUpdate,
    required super.acSwitchState,
    required super.mode,
    required super.fanLevel,
    required super.light,
  }) : super(
          cbjDeviceVendor: CbjDeviceVendor(VendorsAndServices.sensibo),
        );

  @override
  Future<Either<CoreFailure, Unit>> turnOnAc() async {
    final SensiboUtilties? sensiboUtilties =
        SensiboConnectorConjecture().sensiboUtilties;
    if (sensiboUtilties == null) {
      return left(const CoreFailure.unexpected());
    }
    SensiboSky.turnOn(
      apiKey: sensiboUtilties.apiKey,
      sensibo: sensiboUtilties.sensibo,
      id: entityUniqueId.getOrCrash(),
    );
    return right(unit);
  }

  @override
  Future<Either<CoreFailure, Unit>> turnOffAc() async {
    final SensiboUtilties? sensiboUtilties =
        SensiboConnectorConjecture().sensiboUtilties;
    if (sensiboUtilties == null) {
      return left(const CoreFailure.unexpected());
    }
    SensiboSky.turnOff(
      apiKey: sensiboUtilties.apiKey,
      sensibo: sensiboUtilties.sensibo,
      id: entityUniqueId.getOrCrash(),
    );
    return right(unit);
  }
}
