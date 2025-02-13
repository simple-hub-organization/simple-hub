import 'dart:collection';

import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/domain/connections_service.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Show light toggles in a container with the background color from smart area
/// object
class DimmableLightMolecule extends StatefulWidget {
  const DimmableLightMolecule(this.entity);

  final GenericDimmableLightDE entity;

  @override
  State<DimmableLightMolecule> createState() => _DimmableLightMoleculeState();
}

class _DimmableLightMoleculeState extends State<DimmableLightMolecule> {
  double brightness = 100;

  @override
  void initState() {
    super.initState();
    _initialized();
  }

  Future _initialized() async {
    final GenericDimmableLightDE rgbwLightDe = widget.entity;

    double lightBrightness =
        double.parse(rgbwLightDe.lightBrightness.getOrCrash());

    if (lightBrightness > 100) {
      lightBrightness = 100;
    }

    setState(() {
      brightness = lightBrightness;
    });
  }

  Future _changeBrightness(double value) async {
    setState(() {
      brightness = value;
    });

    final HashMap<ActionValues, dynamic> hashValue =
        HashMap<ActionValues, dynamic>()
          ..addEntries([
            MapEntry(ActionValues.brightness, value.round()),
          ]);

    setEntityState(
      EntityProperties.lightBrightness,
      EntityActions.undefined,
      value: hashValue,
    );
  }

  void _onChange(bool value) {
    setEntityState(
      EntityProperties.lightSwitchState,
      value ? EntityActions.on : EntityActions.off,
    );
  }

  void setEntityState(
    EntityProperties property,
    EntityActions action, {
    HashMap<ActionValues, dynamic>? value,
  }) {
    final HashSet<String> uniqueIdByVendor =
        HashSet.from([widget.entity.entitiyCbjUniqueId.getOrCrash()]);

    ConnectionsService.instance.setEntityState(
      RequestActionObject(
        entityIds: uniqueIdByVendor,
        property: property,
        actionType: action,
        value: value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;

    return Column(
      children: [
        TextAtom(
          widget.entity.cbjEntityName.getOrCrash()!,
        ),
        SwitchAtom(
          variant: SwitchVariant.light,
          action: widget.entity.lightSwitchState.action,
          state: widget.entity.entityStateGRPC.state,
          onToggle: _onChange,
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.solidSun,
              ),
              Expanded(
                child: Slider(
                  thumbColor: colorScheme.onBackground,
                  activeColor: colorScheme.tertiary,
                  inactiveColor: colorScheme.outline,
                  value: brightness,
                  divisions: 100,
                  min: 1,
                  max: 100,
                  onChanged: _changeBrightness,
                ),
              ),
              SizedBox(
                width: 45,
                child: TextAtom(
                  '${brightness.round()}%',
                  style: textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
