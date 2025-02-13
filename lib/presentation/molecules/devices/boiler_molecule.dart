import 'dart:collection';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/domain/connections_service.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BoilerMolecule extends StatefulWidget {
  const BoilerMolecule(this.entity);

  final GenericBoilerDE entity;

  @override
  State<BoilerMolecule> createState() => _BoilerMoleculeState();
}

class _BoilerMoleculeState extends State<BoilerMolecule> {
  Future _turnOnAllBoilers() async {
    FlushbarHelper.createLoading(
      message: 'Turning_On_boiler'.tr(),
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    setEntityState(EntityActions.on);
    // IDeviceRepository.instance.moveUpStateDevices(devicesId: blindsIdToTurnUp);
  }

  void setEntityState(EntityActions action) {
    final HashSet<String> uniqueIdByVendor =
        HashSet.from([widget.entity.entitiyCbjUniqueId.getOrCrash()]);

    ConnectionsService.instance.setEntityState(
      RequestActionObject(
        entityIds: uniqueIdByVendor,
        property: EntityProperties.boilerSwitchState,
        actionType: action,
      ),
    );
  }

  Future _turnOffAllBoilers() async {
    FlushbarHelper.createLoading(
      message: 'Turning_Off_boiler'.tr(),
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    setEntityState(EntityActions.off);
  }

  void _onChange(bool value) {
    if (value) {
      _turnOnAllBoilers();
    } else {
      _turnOffAllBoilers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextAtom(
          widget.entity.cbjEntityName.getOrCrash()!,
        ),
        SwitchAtom(
          variant: SwitchVariant.boiler,
          onToggle: _onChange,
          action: widget.entity.boilerSwitchState.action,
          state: widget.entity.entityStateGRPC.state,
        ),
      ],
    );
  }
}
