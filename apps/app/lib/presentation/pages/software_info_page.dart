import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_hub/domain/software_info/i_software_info_repository.dart';
import 'package:simple_hub/domain/software_info/software_info_entity.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/molecules/molecules.dart';

@RoutePage()
class SoftwareInfoPage extends StatelessWidget {
  /// Execute when software nfo press the icon in top right side
  void userCogFunction(BuildContext context) {
    showAdaptiveActionSheet(
      context: context,
      actions: <BottomSheetAction>[
        BottomSheetAction(
          title: const TextAtom(
            '➕ Add software nfo',
            style: TextStyle(color: Colors.green, fontSize: 23),
          ),
          onPressed: (_) {
            // context.router.push(const AddUserToHomeRoute());
          },
        ),
      ],
    );
  }

  void leftIconFunction(BuildContext context) {
    context.router.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBarMolecule(
            pageName: 'Software Info',
            rightIconFunction: userCogFunction,
            leftIcon: FontAwesomeIcons.arrowLeft,
            leftIconFunction: leftIconFunction,
          ),
          Expanded(
            child: SoftwareInfoWidget(),
          ),
        ],
      ),
    );
  }
}

/// Show light toggles in a container with the background color from smart area
/// object
class SoftwareInfoWidget extends StatefulWidget {
  @override
  State<SoftwareInfoWidget> createState() => _SoftwareInfoWidgetState();
}

class _SoftwareInfoWidgetState extends State<SoftwareInfoWidget> {
  Map<String, SoftwareInfoEntity> softwaresInfo = {};

  @override
  void initState() {
    super.initState();
    _initialized();
  }

  Future _initialized() async {
    SoftwareInfoEntity? appInfoEntity;
    (await ISoftwareInfoRepository.instance.getAppSoftwareInfo()).fold(
      (l) => l,
      (r) {
        appInfoEntity = r;
      },
    );

    if (appInfoEntity != null) {
      setState(() {
        softwaresInfo.addEntries([MapEntry('App Server', appInfoEntity!)]);
      });
    }

    SoftwareInfoEntity? hubInfoEntity;
    (await ISoftwareInfoRepository.instance.getHubSoftwareInfo()).fold(
      (l) => l,
      (r) {
        hubInfoEntity = r;
      },
    );

    if (hubInfoEntity != null) {
      setState(() {
        softwaresInfo.addEntries([MapEntry('Hub Server', hubInfoEntity!)]);
      });
    }

    SoftwareInfoEntity? securityBearInfoEntity;
    (await ISoftwareInfoRepository.instance.getSecurityBearSoftwareInfo()).fold(
      (l) => l,
      (r) {
        securityBearInfoEntity = r;
      },
    );

    if (securityBearInfoEntity != null) {
      setState(() {
        softwaresInfo.addEntries([
          MapEntry('Security Bear Server', securityBearInfoEntity!),
        ]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (softwaresInfo.isEmpty) {
      return const CircularProgressIndicatorAtom();
    }

    return ListView.builder(
      itemCount: softwaresInfo.length,
      padding: const EdgeInsets.all(30),
      itemBuilder: (context, i) {
        final String key = softwaresInfo.keys.elementAt(i);
        final SoftwareInfoEntity? softwareInfoEntity = softwaresInfo[key];
        return Column(
          children: [
            TextAtom(
              key,
              style: const TextStyle(fontSize: 26),
            ),
            ListTileTheme(
              textColor: Theme.of(context).textTheme.bodyLarge!.color,
              child: Column(
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        const TextAtom('Entitey name: '),
                        TextAtom(
                          softwareInfoEntity?.deviceName.getOrCrash() ??
                              'No Info',
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        const TextAtom('Pubspec yaml version: '),
                        TextAtom(
                          softwareInfoEntity?.pubspecYamlVersion.getOrCrash() ??
                              'No Info',
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        const TextAtom('Proto last gen date: '),
                        TextAtom(
                          softwareInfoEntity?.protoLastGenDate.getOrCrash() ??
                              'No Info',
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextAtom('Dart SDK version: '),
                        Flexible(
                          child: TextAtom(
                            softwareInfoEntity?.dartSdkVersion.getOrCrash() ??
                                'No Info',
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        const TextAtom('Comp id: '),
                        TextAtom(
                          softwareInfoEntity?.compId.getOrCrash() ?? 'No Info',
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        const TextAtom('Comp uuid: '),
                        TextAtom(
                          softwareInfoEntity?.compUuid.getOrCrash() ??
                              'No Info',
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        const TextAtom('Comp os: '),
                        TextAtom(
                          softwareInfoEntity?.compOs.getOrCrash() ?? 'No Info',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
