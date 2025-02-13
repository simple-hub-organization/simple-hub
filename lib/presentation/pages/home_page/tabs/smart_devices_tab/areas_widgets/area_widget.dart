import 'dart:collection';

import 'package:auto_route/auto_route.dart';
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:cybearjinni/presentation/core/routes/app_router.gr.dart';
import 'package:cybearjinni/presentation/organisms/organisms.dart';
import 'package:flutter/material.dart';

class AreaWidget extends StatefulWidget {
  const AreaWidget({
    required this.area,
    required this.areas,
    required this.entities,
  });

  final AreaEntity area;
  final HashMap<String, AreaEntity> areas;
  final HashMap<String, DeviceEntityBase> entities;

  @override
  State<AreaWidget> createState() => _AreaWidgetState();
}

class _AreaWidgetState extends State<AreaWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.entities.isEmpty) {
      return const SizedBox();
    }

    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    final int numberOfDevicesInTheArea = widget.entities.length;

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              context.router.push(
                EntitiesInAreaRoute(
                  entityTypes: const {},
                  areaEntity: widget.area,
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  TextAtom(
                    widget.area.cbjEntityName.getOrCrash(),
                    style: textTheme.headlineSmall!
                        .copyWith(color: colorScheme.secondary),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  TextAtom(
                    numberOfDevicesInTheArea >= 2
                        ? numberOfDevicesInTheArea.toString()
                        : '',
                    style: textTheme.bodyLarge!
                        .copyWith(color: colorScheme.secondary),
                  ),
                ],
              ),
            ),
          ),
          const SeparatorAtom(variant: SeparatorVariant.closeWidgets),
          DevicesListViewOrganism(
            HashSet.from(widget.entities.values),
            (entity) {
              context.router.push(
                EntitiesInAreaRoute(
                  entityTypes: entity,
                  areaEntity: widget.area,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
