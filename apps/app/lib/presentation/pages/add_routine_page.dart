import 'dart:collection';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/domain/connections_service.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/routes/app_router.gr.dart';
import 'package:simple_hub/presentation/core/snack_bar_service.dart';
import 'package:simple_hub/presentation/molecules/molecules.dart';

/// Page for adding new routine
@RoutePage()
class AddRoutinePage extends StatefulWidget {
  const AddRoutinePage({
    required this.daysToRepeat,
    required this.hourToRepeat,
    required this.minutesToRepeat,
  });

  final RoutineCbjRepeatDateDays daysToRepeat;
  final RoutineCbjRepeatDateHour hourToRepeat;
  final RoutineCbjRepeatDateMinute minutesToRepeat;

  @override
  State<AddRoutinePage> createState() => _AddRoutinePageState();
}

class _AddRoutinePageState extends State<AddRoutinePage> {
  @override
  void initState() {
    super.initState();
    initializeEntities();
  }

  String? routineName;

  RoutineCbjRepeatDateDays? daysToRepeat;
  RoutineCbjRepeatDateHour? hourToRepeat;
  RoutineCbjRepeatDateMinute? minutesToRepeat;

  /// List of devices with entities, will be treated as actions
  HashSet<RequestActionObject> allDevicesWithNewAction = HashSet();

  Set<MapEntry<String, String>> allEntityActions = {};
  bool showErrorMessages = false;
  bool isSubmitting = false;
  HashMap<String, DeviceEntityBase>? entities;

  Future initializeEntities() async {
    final HashMap<String, DeviceEntityBase> entitiesTemp =
        await ConnectionsService.instance.getEntities;

    setState(() {
      entities = entitiesTemp;
    });
  }

  Future _sendRoutineToHub() async {
    if (daysToRepeat == null ||
        hourToRepeat == null ||
        minutesToRepeat == null ||
        routineName == null) {
      return;
    }
    // IRoutineCbjRepository.instance
    //     .addOrUpdateNewRoutineInHubFromDevicesPropertyActionList(
    //   routineName!,
    //   allDevicesWithNewAction,
    //   daysToRepeat!,
    //   hourToRepeat!,
    //   minutesToRepeat!,
    // );
  }

  Future _routineNameChange(String value) async {
    routineName = value;
  }

  Future _addFullAction(RequestActionObject value) async {
    setState(() {
      allDevicesWithNewAction.add(value);
    });
  }

  void backButtonFunction(BuildContext context) {
    context.router.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    if (entities == null) {
      return const Scaffold(
        body: CircularProgressIndicatorAtom(),
      );
    }
    return Scaffold(
      body: ColoredBox(
        color: HexColor('#FBF5F9'),
        child: Column(
          children: [
            TopBarMolecule(
              pageName: 'Add Routine',
              rightIconFunction: backButtonFunction,
              leftIcon: FontAwesomeIcons.arrowLeft,
              leftIconFunction: backButtonFunction,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: FaIcon(FontAwesomeIcons.fileSignature),
                      labelText: 'Routine Name',
                    ),
                    onChanged: _routineNameChange,
                  ),
                  SizedBox(
                    height: 300,
                    width: 500,
                    child: ListView.builder(
                      itemCount: allDevicesWithNewAction.length,
                      itemBuilder: (BuildContext context, int index) {
                        final RequestActionObject currentDevice =
                            allDevicesWithNewAction.elementAt(index);

                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 1),
                          child: ColoredBox(
                            color: Colors.blue.withAlpha((0.3 * 255).toInt()),
                            child: ListTile(
                              leading: const FaIcon(
                                FontAwesomeIcons.lightbulb,
                                color: Colors.yellow,
                              ),
                              title: AutoSizeText(
                                '${entities![currentDevice.entityIds.first]!.cbjEntityName.getOrCrash()!} - ${currentDevice.property.name}',
                                maxLines: 2,
                              ),
                              trailing: AutoSizeText(
                                currentDevice.actionType.name,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      color:
                          Colors.lightBlueAccent.withAlpha((0.5 * 255).toInt()),
                      // Red border with the width is equal to 5
                      border: Border.all(),
                    ),
                    child: TextButton(
                      onPressed: () {
                        showAdaptiveActionSheet(
                          context: context,
                          actions: <BottomSheetAction>[
                            BottomSheetAction(
                              title: const TextAtom(
                                'Add device action',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 23,
                                ),
                              ),
                              onPressed: (_) async {
                                final RequestActionObject? actionList =
                                    await context.router
                                        .push<RequestActionObject?>(
                                  AddActionRoute(entities: entities!),
                                );
                                if (actionList != null) {
                                  _addFullAction(actionList);
                                }
                              },
                            ),
                            BottomSheetAction(
                              title: TextAtom(
                                'Add service action',
                                style: TextStyle(
                                  color: Colors.green.shade600,
                                  fontSize: 23,
                                ),
                              ),
                              onPressed: (_) {
                                SnackBarService().show(
                                  context,
                                  'Adding service action will be added in the future',
                                );
                              },
                            ),
                            BottomSheetAction(
                              title: const TextAtom(
                                'Add time based action',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 23,
                                ),
                              ),
                              onPressed: (_) {
                                SnackBarService().show(
                                  context,
                                  'Adding time based action will be added in the future',
                                );
                              },
                            ),
                          ],
                        );
                      },
                      child: const TextAtom('+ Add action'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color:
                          Colors.lightBlueAccent.withAlpha((0.5 * 255).toInt()),
                      // Red border with the width is equal to 5
                      border: Border.all(),
                    ),
                    child: TextButton(
                      onPressed: () {
                        SnackBarService().show(
                          context,
                          'Adding Routine',
                        );
                        _sendRoutineToHub();
                      },
                      child: const TextAtom('Add Routine'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
