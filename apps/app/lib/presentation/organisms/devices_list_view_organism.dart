import 'dart:collection';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/entities_utils.dart';
import 'package:simple_hub/presentation/core/theme_data.dart';
import 'package:simple_hub/presentation/molecules/molecules.dart';

class DevicesListViewOrganism extends StatelessWidget {
  const DevicesListViewOrganism(
    this.entities,
    this.onTap, {
    this.variant = DevicesListViewOrganismVarient.list,
    this.foldByType = true,
  });

  final HashSet<DeviceEntityBase> entities;
  final Function(HashSet<EntityTypes>) onTap;
  final DevicesListViewOrganismVarient variant;
  final bool foldByType;

  HashSet<EntityTypes> getRelatedTypes(EntityTypes type) {
    if (type == EntityTypes.light ||
        type == EntityTypes.rgbwLights ||
        type == EntityTypes.dimmableLight) {
      return HashSet.from({
        EntityTypes.light,
        EntityTypes.rgbwLights,
        EntityTypes.dimmableLight,
      });
    }

    return HashSet.from({type});
  }

  HashMap<EntityTypes, HashSet<DeviceEntityBase>> geEntitiesByType() {
    final HashMap<EntityTypes, HashSet<DeviceEntityBase>> entitiesByType =
        HashMap();

    for (final DeviceEntityBase entity in entities) {
      final EntityTypes type = getRelatedTypes(entity.entityTypes.type).first;
      HashSet<DeviceEntityBase>? entitiesForType = entitiesByType[type];
      entitiesForType ??= HashSet();
      entitiesForType.add(entity);
      entitiesByType[type] = entitiesForType;
    }

    return entitiesByType;
  }

  Widget cardWidget(
    EntityTypes type,
    HashSet<DeviceEntityBase>? entitiesForType,
  ) {
    if (entitiesForType == null) {
      return const SizedBox();
    }
    final int numberOfType = entitiesForType.length;
    final DeviceEntityBase firstEntityOfType = entitiesForType.first;

    String? headline;
    String? supportingText;

    if (numberOfType == 1) {
      headline = firstEntityOfType.cbjEntityName.getOrCrash();
      supportingText = firstEntityOfType.entityStateGRPC.state.name;
    } else {
      headline = '$numberOfType ${type.name}s';
      supportingText = firstEntityOfType.entityStateGRPC.state.name;
    }

    return GestureDetector(
      child: CardAtom(
        Padding(
          padding: const EdgeInsets.all(15),
          child: ListTileAtom(
            headline: headline,
            supportingText: supportingText,
            leadingIcon: EntitiesUtils.iconOfDeviceType(type),
          ),
        ),
      ),
      onTap: () => onTap(getRelatedTypes(type)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final HashMap<EntityTypes, HashSet<DeviceEntityBase>> entitiesByType =
        geEntitiesByType();

    switch (variant) {
      case DevicesListViewOrganismVarient.list:
        return ListViewMolecule(
          ListViewVeriant.separated,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final EntityTypes type = entitiesByType.keys.elementAt(index);
            final HashSet<DeviceEntityBase>? entitiesForType =
                entitiesByType[type];

            return cardWidget(type, entitiesForType);
          },
          itemCount: entitiesByType.length,
        );
      case DevicesListViewOrganismVarient.grid:
        return GridView.builder(
          shrinkWrap: true,
          itemCount: entitiesByType.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 4,
            childAspectRatio: 1.5,
          ),
          padding: const EdgeInsets.all(AppThemeData.generalSpacing),
          itemBuilder: (context, index) {
            final EntityTypes type = entitiesByType.keys.elementAt(index);
            final HashSet<DeviceEntityBase>? entitiesForType =
                entitiesByType[type];

            return cardWidget(type, entitiesForType);
          },
        );
    }
  }
}

enum DevicesListViewOrganismVarient {
  list,
  grid,
  ;
}
