import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/domain/connections_service.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';

/// object
class SwitchMolecule extends StatefulWidget {
  const SwitchMolecule(this.entity);

  final GenericSwitchDE entity;

  @override
  State<SwitchMolecule> createState() => _SwitchMoleculeState();
}

class _SwitchMoleculeState extends State<SwitchMolecule> {
  int sendNewColorEachMilliseconds = 200;
  Timer? timeFromLastColorChange;
  HSVColor? lastColoredPicked;

  Future _changeAction(bool value) async {
    setEntityState(value ? EntityActions.on : EntityActions.off);
  }

  void setEntityState(EntityActions action) {
    final HashSet<String> uniqueIdByVendor =
        HashSet.from([widget.entity.entityCbjUniqueId.getOrCrash()]);

    ConnectionsService.instance.setEntityState(
      RequestActionObject(
        entityIds: uniqueIdByVendor,
        property: EntityProperties.lightSwitchState,
        actionType: action,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextAtom(
          widget.entity.cbjEntityName.getOrCrash()!,
        ),
        SwitchAtom(
          variant: SwitchVariant.switchVariant,
          onToggle: _changeAction,
          action: widget.entity.switchState.action,
          state: widget.entity.entityStateGRPC.state,
        ),
      ],
    );
  }
}
