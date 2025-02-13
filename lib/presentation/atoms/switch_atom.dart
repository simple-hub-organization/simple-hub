import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SwitchAtom extends StatefulWidget {
  const SwitchAtom({
    required this.variant,
    required this.onToggle,
    required this.action,
    required this.state,
    this.color,
  });

  final SwitchVariant variant;
  final Function(bool) onToggle;
  final EntityActions action;
  final EntityStateGRPC state;
  final Color? color;

  // (bool value)
  @override
  State<SwitchAtom> createState() => _SwitchAtomState();
}

class _SwitchAtomState extends State<SwitchAtom> {
  @override
  void initState() {
    super.initState();
    toggleValue = widget.action == EntityActions.on;
  }

  bool toggleValue = false;

  void onToggle() {
    final bool toggleTemp = !toggleValue;
    widget.onToggle(toggleTemp);
    setState(() {
      toggleValue = toggleTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;

    final Size screenSize = MediaQuery.of(context).size;
    final double sizeBoxWidth = screenSize.width * 0.4;

    IconData activeIcon;
    IconData inactiveIcon;

    switch (widget.variant) {
      case SwitchVariant.light:
        activeIcon = FontAwesomeIcons.solidLightbulb;
        inactiveIcon = FontAwesomeIcons.lightbulb;
      case SwitchVariant.boiler:
        activeIcon = FontAwesomeIcons.temperatureThreeQuarters;
        inactiveIcon = FontAwesomeIcons.temperatureThreeQuarters;
      case SwitchVariant.smartPlug:
        activeIcon = MdiIcons.powerSocketAu;
        inactiveIcon = MdiIcons.powerSocketAu;
      case SwitchVariant.switchVariant:
        activeIcon = MdiIcons.lightSwitch;
        inactiveIcon = MdiIcons.lightSwitch;
      case SwitchVariant.ac:
        activeIcon = MdiIcons.airConditioner;
        inactiveIcon = MdiIcons.airConditioner;
    }
    final Color tempColor =
        !toggleValue ? colorScheme.outline : widget.color ?? Colors.yellow;

    return GestureDetector(
      onTap: onToggle,
      child: Container(
        height: screenSize.height / 2,
        width: sizeBoxWidth,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: tempColor.withAlpha(150),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              toggleValue ? activeIcon : inactiveIcon,
              color: tempColor,
            ),
            const SeparatorAtom(variant: SeparatorVariant.reletedElements),
            TextAtom(toggleValue ? 'On' : 'Off'),
          ],
        ),
      ),
    );

    // return SizedBox(
    //   width: sizeBoxWidth + 15,
    //   child: FlutterSwitch(
    //     width: screenSize.width * 0.25,
    //     height: screenSize.height * 0.065,
    //     toggleSize: screenSize.height * 0.065,
    //     value: toggleValue,
    //     borderRadius: 25.0,
    //     padding: 0.0,
    //     activeToggleColor: colorScheme.onPrimary,
    //     inactiveToggleColor: colorScheme.surfaceVariant,
    //     activeSwitchBorder: Border.all(
    //       color: colorScheme.onBackground,
    //     ),
    //     inactiveSwitchBorder: Border.all(
    //       color: colorScheme.outline,
    //     ),
    //     activeColor: colorScheme.secondary,
    //     inactiveColor: colorScheme.onBackground,
    //     activeIcon: Icon(
    //       activeIcon,
    //       color: colorScheme.secondary,
    //     ),
    //     inactiveIcon: Icon(
    //       inactiveIcon,
    //       color: colorScheme.onBackground,
    //     ),
    //     onToggle: onToggle,
    //   ),
    // );
  }
}

enum SwitchVariant {
  light,
  boiler,
  smartPlug,
  switchVariant,
  ac,
  ;
}
