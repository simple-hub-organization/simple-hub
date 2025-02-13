import 'dart:collection';

import 'package:auto_route/auto_route.dart';
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:cybearjinni/presentation/core/routes/app_router.gr.dart';
import 'package:cybearjinni/presentation/molecules/molecules.dart';
import 'package:cybearjinni/presentation/organisms/organisms.dart';
import 'package:flutter/material.dart';

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
              backgroundColor: colorScheme.background,
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
          DeviceByTypeMolecule(widget.entities.first),
        ],
      ),
    );
  }
}
