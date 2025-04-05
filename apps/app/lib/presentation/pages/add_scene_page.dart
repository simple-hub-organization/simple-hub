import 'dart:collection';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/domain/connections_service.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/entities_utils.dart';
import 'package:simple_hub/presentation/core/routes/app_router.gr.dart';
import 'package:simple_hub/presentation/core/snack_bar_service.dart';
import 'package:simple_hub/presentation/organisms/organisms.dart';

/// Page for adding new scene
@RoutePage()
class AddScenePage extends StatefulWidget {
  @override
  State<AddScenePage> createState() => _AddScenePageState();
}

class _AddScenePageState extends State<AddScenePage> {
  @override
  void initState() {
    super.initState();
    initializeEntities();
  }

  String sceneName = '';
  HashMap<String, DeviceEntityBase>? entities;

  /// List of devices with entities, will be treated as actions
  HashSet<RequestActionObject> entitiesWithActions = HashSet();

  Future initializeEntities() async {
    final HashMap<String, DeviceEntityBase> entitiesTemp =
        await ConnectionsService.instance.getEntities;

    setState(() {
      entities = entitiesTemp;
    });
  }

  Future _sendSceneToHub() async {
    final SceneEntity scene = SceneEntity(
      uniqueId: UniqueId(),
      name: SceneCbjName(sceneName),
      backgroundColor: SceneCbjBackgroundColor(Colors.red.toString()),
      nodeRedFlowId: SceneCbjNodeRedFlowId(''),
      firstNodeId: SceneCbjFirstNodeId(''),
      iconCodePoint:
          SceneCbjIconCodePoint(Icons.microwave.codePoint.toString()),
      image: SceneCbjBackgroundImage(''),
      lastDateOfExecute: SceneCbjLastDateOfExecute(''),
      stateMassage: SceneCbjStateMassage(''),
      senderDeviceOs: SceneCbjSenderDeviceOs(''),
      senderDeviceModel: SceneCbjSenderDeviceModel(''),
      senderId: SceneCbjSenderId(''),
      compUuid: SceneCbjCompUuid(''),
      entityStateGRPC: SceneCbjDeviceStateGRPC(EntityStateGRPC.ack.name),
      actions: entitiesWithActions.toList(),
      areaPurposeType: AreaPurposesTypes.undefined,
      entitiesWithAutomaticPurpose: EntitiesWithAutomaticPurpose(HashSet()),
    );

    ConnectionsService.instance.addScene(scene);
  }

  Future _addFullAction(RequestActionObject value) async {
    setState(() {
      entitiesWithActions.add(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (entities == null) {
      return const CircularProgressIndicatorAtom();
    }

    return PageOrganism(
      pageName: 'Add Scene',
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: FaIcon(FontAwesomeIcons.fileSignature),
                labelText: 'Scene Name',
              ),
              onChanged: (value) => sceneName = value,
            ),
            SizedBox(
              height: 300,
              width: 500,
              child: ListView.builder(
                itemCount: entitiesWithActions.length,
                itemBuilder: (BuildContext context, int index) {
                  final RequestActionObject currentDevice =
                      entitiesWithActions.elementAt(index);
                  final DeviceEntityBase? entity =
                      entities![currentDevice.entityIds.first];
                  if (entity == null) {
                    return const SizedBox();
                  }

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 1),
                    child: ColoredBox(
                      color: Colors.blue.withAlpha((0.3 * 255).toInt()),
                      child: ListTile(
                        leading: FaIcon(
                          EntitiesUtils.iconOfDeviceType(
                            entity.entityTypes.type,
                          ),
                        ),
                        title: AutoSizeText(
                          '${entity.cbjEntityName.getOrCrash()!} - ${currentDevice.property.name}',
                          maxLines: 2,
                        ),
                        trailing: AutoSizeText(
                          currentDevice.actionType.name,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent.withAlpha((0.5 * 255).toInt()),
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
                              await context.router.push<RequestActionObject?>(
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
                        onPressed: (_) => SnackBarService().show(
                          context,
                          'Adding service action will be added in the future',
                        ),
                      ),
                      BottomSheetAction(
                        title: const TextAtom(
                          'Add time based action',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 23,
                          ),
                        ),
                        onPressed: (_) => SnackBarService().show(
                          context,
                          'Adding time based action will be added in the future',
                        ),
                      ),
                    ],
                  );
                },
                child: const TextAtom('+ Add action'),
              ),
            ),
            const SizedBox(height: 10),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent.withAlpha((0.5 * 255).toInt()),
                // Red border with the width is equal to 5
                border: Border.all(),
              ),
              child: TextButton(
                onPressed: () {
                  context.router.maybePop();

                  SnackBarService().show(
                    context,
                    'Adding Scene',
                  );
                  _sendSceneToHub();
                },
                child: const TextAtom('Add Scene'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
