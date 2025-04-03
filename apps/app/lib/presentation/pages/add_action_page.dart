import 'dart:collection';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/snack_bar_service.dart';
import 'package:simple_hub/presentation/organisms/organisms.dart';

@RoutePage()
class AddActionPage extends StatefulWidget {
  const AddActionPage({required this.entities});

  final HashMap<String, DeviceEntityBase> entities;

  @override
  State<AddActionPage> createState() => _AddActionPageState();
}

class _AddActionPageState extends State<AddActionPage> {
  DeviceEntityBase? selectedEntity;
  EntityProperties? selectedProperty;
  EntityActions? selectedAction;
  String? fieldValues;
  ActionValues? actionType;
  String? actionValue;

  void onEntitySelect(String entityId) {
    setState(() {
      selectedEntity = widget.entities[entityId];
    });
  }

  Future onActionSelected(String value) async {
    setState(() {
      selectedAction = EntityActions.values.elementAt(int.parse(value));
    });
  }

  Future _onPropertySelected(String property) async {
    setState(() {
      selectedProperty = EntityProperties.values.elementAt(int.parse(property));
    });
  }

  void onSelectedActionType(String value) {
    setState(() {
      actionType = ActionValues.values.elementAt(int.parse(value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageOrganism(
      pageName: 'Add Action',
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SeparatorAtom(),
            const Row(
              children: [
                TextAtom(
                  'Choose Action',
                  style: TextStyle(fontSize: 27),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  DropdownButton<String>(
                    dropdownColor: Colors.black,
                    style: const TextStyle(color: Colors.white),
                    icon: const Icon(Icons.arrow_drop_down),
                    hint: TextAtom(
                      selectedEntity?.cbjEntityName.getOrCrash() ?? 'Entity',
                      style: const TextStyle(color: Colors.white),
                    ),
                    elevation: 16,
                    underline: Container(
                      height: 2,
                    ),
                    onChanged: (value) => onEntitySelect(value!),
                    items: widget.entities.values
                        .map<DropdownMenuItem<String>>((e) {
                      return DropdownMenuItem<String>(
                        value: e.getCbjEntityId,
                        child: TextAtom(e.cbjEntityName.getOrCrash()!),
                      );
                    }).toList(),
                  ),
                  const SeparatorAtom(variant: SeparatorVariant.farApart),
                  DropdownButton<String>(
                    dropdownColor: Colors.black,
                    style: const TextStyle(color: Colors.white),
                    icon: const Icon(Icons.arrow_drop_down),
                    hint: TextAtom(
                      selectedProperty?.name ?? 'Property',
                      style: const TextStyle(color: Colors.white),
                    ),
                    elevation: 16,
                    underline: Container(
                      height: 2,
                    ),
                    onChanged: (value) => _onPropertySelected(value!),
                    items: selectedEntity
                            ?.getListOfPropertiesToChange()
                            .map<DropdownMenuItem<String>>((e) {
                          return DropdownMenuItem<String>(
                            value: e.index.toString(),
                            child: TextAtom(e.name),
                          );
                        }).toList() ??
                        <DropdownMenuItem<String>>[
                          const DropdownMenuItem<String>(
                            value: 'Choose entity first',
                            child: TextAtom('Choose entity first'),
                          ),
                        ],
                  ),
                  const SeparatorAtom(variant: SeparatorVariant.farApart),
                  DropdownButton<String>(
                    dropdownColor: Colors.black,
                    style: const TextStyle(color: Colors.white),
                    icon: const Icon(Icons.arrow_drop_down),
                    hint: TextAtom(
                      selectedAction?.name ?? 'Action',
                      style: const TextStyle(color: Colors.white),
                    ),
                    elevation: 16,
                    underline: Container(
                      height: 2,
                    ),
                    onChanged: (value) => onActionSelected(value!),
                    items: (selectedProperty != null &&
                            selectedProperty!.getActions.isNotEmpty)
                        ? selectedProperty!.getActions
                            .map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem<String>(
                              value: e.index.toString(),
                              child: TextAtom(e.name),
                            );
                          }).toList()
                        : const <DropdownMenuItem<String>>[
                            DropdownMenuItem<String>(
                              value: 'Choose property first',
                              child: TextAtom('Choose property first'),
                            ),
                          ],
                  ),
                  const SeparatorAtom(variant: SeparatorVariant.farApart),
                  const TextAtom('Field value'),
                  const SeparatorAtom(),
                  DropdownButton<String>(
                    dropdownColor: Colors.black,
                    style: const TextStyle(color: Colors.white),
                    icon: const Icon(Icons.arrow_drop_down),
                    hint: TextAtom(
                      actionType?.name ?? 'Value',
                      style: const TextStyle(color: Colors.white),
                    ),
                    elevation: 16,
                    underline: Container(
                      height: 2,
                    ),
                    onChanged: (value) => onSelectedActionType(value!),
                    items: (selectedAction != null)
                        ? ActionValues.values
                            .map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem<String>(
                              value: e.index.toString(),
                              child: TextAtom(e.name),
                            );
                          }).toList()
                        : const <DropdownMenuItem<String>>[
                            DropdownMenuItem<String>(
                              value: 'Choose action first',
                              child: TextAtom('Choose action first'),
                            ),
                          ],
                  ),
                  const SeparatorAtom(),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 100),
                    child: TextFormFieldAtom(
                      onChanged: (c) {
                        fieldValues = c;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SeparatorAtom(variant: SeparatorVariant.farApart),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    SnackBarService().show(context, 'Add action');
                    if (selectedEntity == null ||
                        selectedProperty == null ||
                        selectedAction == null) {
                      return;
                    }
                    final RequestActionObject entityActionObject =
                        RequestActionObject(
                      entityIds: HashSet.from([selectedEntity!.getCbjEntityId]),
                      property: selectedProperty!,
                      actionType: selectedAction!,
                      value: actionType == null ||
                              fieldValues == null ||
                              fieldValues!.isEmpty
                          ? null
                          : HashMap.fromEntries(
                              [MapEntry(actionType!, fieldValues)],
                            ),
                    );
                    context.router
                        .maybePop<RequestActionObject?>(entityActionObject);
                  },
                  child: const TextAtom(
                    'Done',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            const SeparatorAtom(),
          ],
        ),
      ),
    );
  }
}
