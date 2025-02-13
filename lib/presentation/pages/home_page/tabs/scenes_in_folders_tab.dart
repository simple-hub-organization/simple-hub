import 'dart:collection';

import 'package:auto_route/auto_route.dart';
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:cybearjinni/presentation/core/routes/app_router.gr.dart';
import 'package:cybearjinni/presentation/molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScenesInFoldersTab extends StatelessWidget {
  const ScenesInFoldersTab({required this.scenes, this.areas});

  final HashMap<String, SceneCbjEntity>? scenes;
  final HashMap<String, AreaEntity>? areas;

  Widget scenesFoldersWidget(
    BuildContext context,
    AreaEntity folderOfScenes,
  ) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;

    const double borderRadius = 5;
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: NetworkImage(
            folderOfScenes.background.getOrCrash(),
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
        border: Border.all(
          color: Colors.black.withOpacity(0.7),
          width: 0.4,
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.zero,
          ),
        ),
        onPressed: () {
          context.router.push(
            ScenesRoute(
              area: folderOfScenes,
            ),
          );
        },
        child: Column(
          children: [
            const SizedBox(
              height: 130,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(borderRadius),
                  bottomLeft: Radius.circular(borderRadius),
                ),
              ),
              child: TextAtom(
                folderOfScenes.cbjEntityName.getOrCrash(),
                style: TextStyle(
                  color: colorScheme.onPrimaryContainer,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (scenes == null || scenes!.isEmpty) {
      final ThemeData themeData = Theme.of(context);
      final TextTheme textTheme = themeData.textTheme;

      return Center(
        child: TextAtom(
          'You can add automations in the plus button',
          style: textTheme.bodyLarge,
        ),
      );
    }
    areas!.removeWhere((key, value) => value.scenesId.getOrCrash().isEmpty);

    return Column(
      children: <Widget>[
        TopBarMolecule(
          pageName: 'Automations',
          leftIcon: FontAwesomeIcons.sitemap,
          leftIconFunction: (BuildContext context) {},
        ),
        Expanded(
          child: ListView.builder(
            reverse: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final AreaEntity sceneFolder = areas!.values.elementAt(index);

              return scenesFoldersWidget(
                context,
                sceneFolder,
              );
            },
            itemCount: areas!.length,
          ),
        ),
      ],
    );
  }
}
