import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/molecules/molecules.dart';
import 'package:simple_hub/presentation/pages/home_page/tabs/smart_devices_tab/areas_widgets/areas_list_view_widget.dart';

class EntitiesByAreaTab extends StatelessWidget {
  const EntitiesByAreaTab({
    required this.areas,
    required this.entities,
  });

  final HashMap<String, AreaEntity> areas;
  final HashMap<String, DeviceEntityBase> entities;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Column(
      children: <Widget>[
        TopBarMolecule(
          pageName: 'Entities',
          leftIcon: FontAwesomeIcons.solidLightbulb,
          leftIconFunction: (BuildContext context) {},
        ),
        Expanded(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                TextAtom(
                  'Areas',
                  style: textTheme.headlineLarge,
                ),
                const SeparatorAtom(variant: SeparatorVariant.farApart),
                MarginedExpandedAtom(
                  child: AreasListViewWidget(
                    entities: entities,
                    areas: areas,
                  ),
                ),
                const SeparatorAtom(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
