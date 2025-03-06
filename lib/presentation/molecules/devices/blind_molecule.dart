import 'dart:collection';

import 'package:another_flushbar/flushbar_helper.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/domain/connections_service.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:cybearjinni/presentation/molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Show light toggles in a container with the background color from smart area
/// object
class BlindMolecule extends StatefulWidget {
  const BlindMolecule(this.entity);

  final GenericBlindsDE entity;

  @override
  State<BlindMolecule> createState() => _BlindMoleculeState();
}

class _BlindMoleculeState extends State<BlindMolecule> {
  Future _moveUpAllBlinds() async {
    FlushbarHelper.createLoading(
      // message: 'Pulling_Up_all_blinds'.tr(),
      message: 'Pulling_Up_all_blinds',
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    setEntityState(EntityActions.moveUp);
  }

  void setEntityState(EntityActions action) {
    final HashSet<String> uniqueIdByVendor =
        HashSet.from([widget.entity.entityCbjUniqueId.getOrCrash()]);

    ConnectionsService.instance.setEntityState(
      RequestActionObject(
        entityIds: uniqueIdByVendor,
        property: EntityProperties.blindsSwitchState,
        actionType: action,
      ),
    );
  }

  Future _stopAllBlinds(List<String> blindsIdToStop) async {
    FlushbarHelper.createLoading(
      // message: 'Stopping_all_blinds'.tr(),
      message: 'Stopping_all_blinds',
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    setEntityState(EntityActions.stop);
  }

  Future _moveDownAllBlinds(List<String> blindsIdToTurnDown) async {
    FlushbarHelper.createLoading(
      // message: 'Pulling_down_all_blinds'.tr(),
      message: 'Pulling_down_all_blinds',
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    setEntityState(EntityActions.moveDown);
  }

  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;

    final deviceState = widget.entity.entityStateGRPC.getOrCrash();
    final deviceAction = widget.entity.blindsSwitchState!.getOrCrash();

    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;

    // bool toggleValue = false;
    // Color toggleColor = Colors.blueGrey;

    if (deviceAction == EntityActions.on.toString()) {
      // toggleValue = true;
      if (deviceState == EntityStateGRPC.ack.toString()) {
        // toggleColor = const Color(0xFFFFDF5D);
      }
    } else {
      if (deviceState == EntityStateGRPC.ack.toString()) {
        // toggleColor = Theme.of(context).primaryColorDark;
      }
    }

    return DeviceNameRowMolecule(
      widget.entity.cbjEntityName.getOrCrash()!,
      Row(
        children: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                colorScheme.surface,
              ),
              side: WidgetStateProperty.all(
                BorderSide.lerp(
                  const BorderSide(color: Colors.white60),
                  const BorderSide(color: Colors.white60),
                  22,
                ),
              ),
            ),
            onPressed: () {
              _moveDownAllBlinds(
                [widget.entity.cbjDeviceVendor.getOrCrash()],
              );
            },
            child: Tab(
              icon: FaIcon(
                FontAwesomeIcons.arrowDown,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
              child: TextAtom(
                'Down',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                colorScheme.surface,
              ),
              side: WidgetStateProperty.all(
                BorderSide.lerp(
                  const BorderSide(color: Colors.white60),
                  const BorderSide(color: Colors.white60),
                  22,
                ),
              ),
            ),
            onPressed: () {
              _stopAllBlinds(
                [widget.entity.cbjDeviceVendor.getOrCrash()],
              );
            },
            child: Tab(
              icon: FaIcon(
                FontAwesomeIcons.solidHand,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
              child: TextAtom(
                'Stop',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                colorScheme.surface,
              ),
              side: WidgetStateProperty.all(
                BorderSide.lerp(
                  const BorderSide(color: Colors.white60),
                  const BorderSide(color: Colors.white60),
                  22,
                ),
              ),
            ),
            onPressed: () {
              _moveUpAllBlinds();
            },
            child: Tab(
              icon: FaIcon(
                FontAwesomeIcons.arrowUp,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
              child: TextAtom(
                'Up',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
