import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';

class LightCardMolecule extends StatelessWidget {
  const LightCardMolecule(this.entity);

  final GenericLightDE? entity;

  Future _onChange(bool value) async {
    // final GenericLightDE tempDeviceEntity = entity!
    //   ..entityStateGRPC = EntityState.state(EntityStateGRPC.waitingInCloud)
    //   ..lightSwitchState = GenericLightSwitchState(value.toString());

    if (value) {
      // await IDeviceRepository.instance.turnOnDevices(
      //   devicesId: [tempDeviceEntity.entityCbjUniqueId.getOrCrash()],
      // );
    } else {
      // await IDeviceRepository.instance.turnOffDevices(
      //   devicesId: [tempDeviceEntity.entityCbjUniqueId.getOrCrash()],
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SwitchAtom(
      variant: SwitchVariant.light,
      onToggle: _onChange,
      action: entity!.lightSwitchState.action,
      state: entity!.entityStateGRPC.state,
    );
  }
}
