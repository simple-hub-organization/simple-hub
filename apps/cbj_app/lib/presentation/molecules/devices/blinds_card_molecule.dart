// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:flutter/material.dart';

class BlindsCardMolecule extends StatelessWidget {
  const BlindsCardMolecule(this.entity);

  final GenericLightDE entity;

  @override
  Widget build(BuildContext context) {
    final deviceState = entity.entityStateGRPC.getOrCrash();
    final deviceAction = entity.lightSwitchState.getOrCrash();

    if (deviceAction == EntityActions.on.toString()) {
      if (deviceState == EntityStateGRPC.ack.toString()) {
        // toggleColor = const Color(0xFFFFDF5D);
      }
    } else {
      if (deviceState == EntityStateGRPC.ack.toString()) {
        // toggleColor = Theme.of(context).primaryColorDark;
      }
    }

    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: const TextAtom(
        'Blinds action is not yet supported when adding new blinds',
      ),
    );
  }
}
