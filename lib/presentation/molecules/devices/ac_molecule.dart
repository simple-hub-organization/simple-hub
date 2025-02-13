import 'dart:collection';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/domain/connections_service.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AcMolecule extends StatefulWidget {
  const AcMolecule(this.entity);

  final GenericAcDE entity;

  @override
  State<AcMolecule> createState() => _AcMoleculeState();
}

class _AcMoleculeState extends State<AcMolecule> {
  Future _turnOnAllAcs() async {
    FlushbarHelper.createLoading(
      message: 'Turning_On_ac'.tr(),
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    setEntityState(EntityActions.on);
    // IDeviceRepository.instance.moveUpStateDevices(devicesId: blindsIdToTurnUp);
  }

  void setEntityState(EntityActions action) {
    final HashSet<String> entitiesId =
        HashSet.from([widget.entity.entitiyCbjUniqueId.getOrCrash()]);

    ConnectionsService.instance.setEntityState(
      RequestActionObject(
        entityIds: entitiesId,
        property: EntityProperties.acSwitchState,
        actionType: action,
      ),
    );
  }

  Future _turnOffAllAcs() async {
    FlushbarHelper.createLoading(
      message: 'Turning_Off_ac'.tr(),
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    setEntityState(EntityActions.off);
  }

  void _onChange(bool value) {
    if (value) {
      _turnOnAllAcs();
    } else {
      _turnOffAllAcs();
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
          variant: SwitchVariant.ac,
          onToggle: _onChange,
          action: widget.entity.acSwitchState.action!,
          state: widget.entity.entityStateGRPC.state,
        ),
      ],
    );
  }
}
