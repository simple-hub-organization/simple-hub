import 'dart:async';
import 'dart:collection';

// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/domain/connections_service.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:flutter/material.dart';

/// Show smartPlug toggles in a container with the background color from smart area
/// object
class SmartPlugsMolecule extends StatefulWidget {
  const SmartPlugsMolecule(this.entity);

  final GenericSmartPlugDE entity;

  @override
  State<SmartPlugsMolecule> createState() => _SmartPlugsMoleculeState();
}

class _SmartPlugsMoleculeState extends State<SmartPlugsMolecule> {
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
          variant: SwitchVariant.smartPlug,
          onToggle: _changeAction,
          action: widget.entity.smartPlugState.action,
          state: widget.entity.entityStateGRPC.state,
        ),
      ],
    );
  }
}
