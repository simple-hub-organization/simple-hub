import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/domain/connections_service.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/snack_bar_service.dart';

class SceneAtom extends StatefulWidget {
  const SceneAtom(this.currentScene);

  final SceneEntity currentScene;

  @override
  State<SceneAtom> createState() => _SceneAtomState();
}

class _SceneAtomState extends State<SceneAtom> {
  late SceneEntity sceneCbj;

  Future _activateScene() => ConnectionsService.instance
      .activateScene(widget.currentScene.uniqueId.getOrCrash());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          // Color(
          // int.parse(widget.currentScene.backgroundColor.getOrCrash()),
          // ),
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(
              color: Theme.of(context).textTheme.bodyLarge!.color!,
              width: 0.6,
            ),
          ),
        ),
        onPressed: () {
          HapticFeedback.lightImpact();

          SnackBarService().show(
            context,
            'Activating Scene',
          );
          _activateScene();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black54,
          ),
          alignment: Alignment.center,
          child: TextAtom(
            widget.currentScene.name.getOrCrash(),
            style: TextStyle(
              fontSize: 23,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
