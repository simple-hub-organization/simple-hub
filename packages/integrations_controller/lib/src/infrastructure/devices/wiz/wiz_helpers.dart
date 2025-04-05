import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';

class WizHelpers {
  static DeviceEntityBase? addDiscoveredDevice({
    // required WizBulb wizDevice,
    required CoreUniqueId? uniqueDeviceId,
  }) {
    // CoreUniqueId uniqueDeviceIdTemp;
    //
    // if (uniqueDeviceId != null) {
    //   uniqueDeviceIdTemp = uniqueDeviceId;
    // } else {
    //   uniqueDeviceIdTemp = CoreUniqueId();
    // }
    return null;
    // final WizWhiteEntity wizDE = WizWhiteEntity(
    //   uniqueId: uniqueDeviceIdTemp,
    //   entityUniqueId: EntityUniqueId.fromUniqueString(wizDevice.id),
    //   cbjEntityName: CbjEntityName(value:
    //     wizDevice.label != '' ? wizDevice.label : 'Wiz test 2',
    //   ),
    //   entityStateGRPC: EntityState.state(EntityStateGRPC.ack),
    //   senderDeviceOs: DeviceSenderDeviceOs('Wiz'),
    //   senderDeviceModel: DeviceSenderDeviceModel('Cloud'),
    //   senderId: DeviceSenderId(),
    //   compUuid: DeviceCompUuid(wizDevice.uuid),
    //   stateMassage: DeviceStateMassage(value: 'Hello World'),
    //   powerConsumption: DevicePowerConsumption('0'),
    //   lightSwitchState: GenericLightSwitchState(
    //     (wizDevice.power == WizPower.on).toString(),
    //   ),
    // );

    // return wizDE;

    // TODO: Add if device type does not supported return null
    // logger.i(
    //   'Please add new philips device type Bulb ${wizDevice.label}',
    // );
    // return null;
  }
}
