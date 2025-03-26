import 'dart:collection';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/routes/app_router.gr.dart';
import 'package:simple_hub/presentation/molecules/molecules.dart';
import 'package:simple_hub/presentation/organisms/organisms.dart';

class OpenAreaOrganism extends StatefulWidget {
  const OpenAreaOrganism({
    required this.area,
    required this.entityTypes,
    required this.entities,
  });

  /// If it have value will only show Printers in this area
  final AreaEntity area;
  final Set<EntityTypes> entityTypes;
  final Set<DeviceEntityBase> entities;

  @override
  State<OpenAreaOrganism> createState() => _OpenAreaOrganismState();
}

class _OpenAreaOrganismState extends State<OpenAreaOrganism> {
  @override
  Widget build(BuildContext context) {
    if (widget.entities.isEmpty) {
      return EmptyOpenAreaOrganism();
    }

    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ColoredBox(
            color: colorScheme.onPrimary,
            child: ExpansionTile(
              backgroundColor: colorScheme.surface,
              title: Text(
                '${widget.entities.length} ${widget.entities.first.entityTypes.type.name}',
              ),
              children: [
                DevicesListViewOrganism(
                  HashSet.from(widget.entities),
                  (entity) {
                    context.router.push(
                      EntitiesInAreaRoute(
                        entityTypes: entity,
                        areaEntity: widget.area,
                      ),
                    );
                  },
                  varient: DevicesListViewOrganismVarient.grid,
                ),
              ],
            ),
          ),
          const SeparatorAtom(),
          DeviceByTypeMolecule(
            widget.entities.first,
            entitiesId: widget.entities
                .map((toElement) => toElement.entityCbjUniqueId.getOrCrash())
                .toList(),
          ),
        ],
      ),
    );
  }
}
