import 'dart:collection';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/molecules/molecules.dart';
import 'package:simple_hub/presentation/pages/home_page/tabs/smart_devices_tab/areas_widgets/area_widget.dart';

class AreasListViewWidget extends StatelessWidget {
  const AreasListViewWidget({
    required this.entities,
    required this.areas,
  });

  final HashMap<String, DeviceEntityBase> entities;
  final HashMap<String, AreaEntity> areas;

  HashMap<String, Set<String>> initializeEntitiesByAreas() {
    final HashMap<String, Set<String>> devicesByAreas = HashMap();

    devicesByAreas.addAll(
      areas.map((key, value) => MapEntry(key, value.entitiesId.getOrCrash())),
    );
    return devicesByAreas;
  }

  @override
  Widget build(BuildContext context) {
    final HashMap<String, Set<String>> devicesByAreas =
        initializeEntitiesByAreas();

    return ListViewMolecule(
      ListViewVeriant.separated,
      separatorVariant: SeparatorVariant.generalSpacing,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final String areaId = devicesByAreas.keys.elementAt(index);
        final Set<String>? entitiesInTheArea = devicesByAreas[areaId];
        final AreaEntity? area = areas[areaId];

        if (entitiesInTheArea == null || area == null) {
          return const SizedBox();
        }

        return AreaWidget(
          area: area,
          areas: areas,
          entities: HashMap.fromEntries(
            entitiesInTheArea.map((e) {
              final DeviceEntityBase? eneity = entities[e];
              if (eneity == null) {
                return null;
              }
              return MapEntry(e, eneity);
            }).nonNulls,
          ),
        );
      },
      itemCount: devicesByAreas.length,
    );
  }
}
