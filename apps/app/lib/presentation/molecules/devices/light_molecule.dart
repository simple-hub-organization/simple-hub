import 'dart:collection';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/domain/connections_service.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';

/// Show light toggles in a container with the background color from smart area
/// object
class LightMolecule extends StatelessWidget {
  const LightMolecule(this.entity);

  final GenericLightDE entity;

  void _onChange(bool value) {
    setEntityState(value ? EntityActions.on : EntityActions.off);
  }

  void setEntityState(EntityActions action) {
    final HashSet<String> uniqueIdByVendor =
        HashSet.from([entity.entityCbjUniqueId.getOrCrash()]);

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
    return SwitchAtom(
      variant: SwitchVariant.light,
      onToggle: _onChange,
      action: entity.lightSwitchState.action,
      state: entity.entityStateGRPC.state,
    );
  }
}
