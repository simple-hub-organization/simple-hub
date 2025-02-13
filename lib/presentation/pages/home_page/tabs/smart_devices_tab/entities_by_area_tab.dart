import 'dart:collection';

import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:cybearjinni/presentation/molecules/molecules.dart';
import 'package:cybearjinni/presentation/pages/home_page/tabs/smart_devices_tab/areas_widgets/areas_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                const SeparatorAtom(variant: SeparatorVariant.farAppart),
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
