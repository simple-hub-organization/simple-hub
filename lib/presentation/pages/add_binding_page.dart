import 'dart:collection';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/domain/connections_service.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:cybearjinni/presentation/core/routes/app_router.gr.dart';
import 'package:cybearjinni/presentation/core/snack_bar_service.dart';
import 'package:cybearjinni/presentation/molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

/// Page for adding new binding
@RoutePage()
class AddBindingPage extends StatefulWidget {
  @override
  State<AddBindingPage> createState() => _AddBindingPageState();
}

class _AddBindingPageState extends State<AddBindingPage> {
  void backButtonFunction(BuildContext context) {
    context.router.pop();
  }

  @override
  void initState() {
    super.initState();
    initializeEntities();
  }

  HashMap<String, DeviceEntityBase>? entities;

  String bindingName = '';

  /// List of devices with entities, will be treated as actions
  HashSet<RequestActionObject> allDevicesWithNewAction = HashSet();
  Set<MapEntry<String, String>> allEntityActions = {};
  bool showErrorMessages = false;
  bool isSubmitting = false;

  Future initializeEntities() async {
    final HashMap<String, DeviceEntityBase> entitiesTemp =
        await ConnectionsService.instance.getEntities;

    setState(() {
      entities = entitiesTemp;
    });
  }

  Future _sendBindingToHub() async {
    // IBindingCbjRepository.instance
    //     .addOrUpdateNewBindingInHubFromDevicesPropertyActionList(
    //   bindingName,
    //   allDevicesWithNewAction,
    // );
  }

  Future _addFullAction(RequestActionObject value) async {
    setState(() {
      allDevicesWithNewAction.add(value);
    });
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
              pageName: 'Add Binding',
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
                      labelText: 'Binding Name',
                    ),
                    onChanged: (value) {
                      bindingName = value;
                    },
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
                            color: Colors.blue.withOpacity(0.3),
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
                      color: Colors.lightBlueAccent.withOpacity(0.5),
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
                      color: Colors.lightBlueAccent.withOpacity(0.5),
                      // Red border with the width is equal to 5
                      border: Border.all(),
                    ),
                    child: TextButton(
                      onPressed: () {
                        SnackBarService().show(
                          context,
                          'Adding Binding',
                        );
                        _sendBindingToHub();
                      },
                      child: const TextAtom('Add Binding'),
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
