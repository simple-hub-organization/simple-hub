import 'package:auto_route/auto_route.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/domain/connections_service.dart';
import 'package:cybearjinni/infrastructure/core/logger.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:cybearjinni/presentation/core/routes/app_router.gr.dart';
import 'package:cybearjinni/presentation/molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/simple_icons.dart';

@RoutePage()
class PlusButtonPage extends StatelessWidget {
  Future _logout(BuildContext context) async {
    context.router.replace(const ConnectToHubRoute());
    final String? bssid = NetworksManager().currentNetwork?.bssid;
    if (bssid == null) {
      logger.e('Please set up network');
      return;
    }
    ConnectionsService.setCurrentConnectionType(
      networkBssid: bssid,
      connectionType: ConnectionType.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    return Scaffold(
      body: Column(
        children: [
          TopBarMolecule(
            pageName: 'Add and Manage',
            leftIcon: FontAwesomeIcons.arrowLeft,
            leftIconFunction: (_) => context.router.maybePop(),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.topLeft,
                  child: TextAtom(
                    'Add:',
                    style: textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ColoredBox(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 1,
                      ),
                      ColoredBox(
                        color: Colors.teal.withAlpha((0.9 * 255).toInt()),
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.solidLightbulb,
                            color: colorScheme.surface,
                          ),
                          title: TextAtom(
                            'Manage Entities',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                          ),
                          onTap: () => context.router
                              .push(const ChangeAreaForDevicesRoute()),
                        ),
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      ColoredBox(
                        color: Colors.brown.withAlpha((0.9 * 255).toInt()),
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.arrowRightToBracket,
                            color: colorScheme.surface,
                          ),
                          title: TextAtom(
                            'Login To Vendor',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                          ),
                          onTap: () {
                            context.router
                                .push(const ChooseDeviceVendorToAddRoute());
                          },
                        ),
                      ),
                      const SizedBox(height: 1),
                      ColoredBox(
                        color: Colors.purple.withAlpha((0.7 * 255).toInt()),
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.sitemap,
                            color: colorScheme.surface,
                          ),
                          title: TextAtom(
                            'Add Automation',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                          ),
                          onTap: () {
                            context.router
                                .push(const ChooseAutomationTypeToAddRoute());
                          },
                        ),
                      ),
                      const SizedBox(height: 1),
                      ColoredBox(
                        color:
                            Colors.indigoAccent.withAlpha((0.7 * 255).toInt()),
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.camera,
                            color: colorScheme.surface,
                          ),
                          title: TextAtom(
                            'Turn Phone To a Security Camera',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                          ),
                          onTap: () async {
                            context.router
                                .push(const SmartCameraContainerRoute());
                            // await IHubConnectionRepository.instance
                            //     .closeConnection();
                          },
                        ),
                      ),
                      const SizedBox(height: 1),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextAtom(
                    'Manage:',
                    style: textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ColoredBox(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(height: 1),
                      ColoredBox(
                        color: Colors.blue,
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.globe,
                            color: colorScheme.surface,
                          ),
                          title: TextAtom(
                            'Comunication Method',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                          ),
                          onTap: () {
                            context.router
                                .push(const ComunicationMethodRoute());
                          },
                        ),
                      ),
                      const SizedBox(height: 1),
                      ColoredBox(
                        color: Colors.pink.withAlpha((0.9 * 255).toInt()),
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.computer,
                            color: colorScheme.surface,
                          ),
                          title: TextAtom(
                            'All Entities in the network',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                          ),
                          onTap: () => context.router
                              .push(const EntitiesInNetworkRoute()),
                        ),
                      ),
                      if (ConnectionsService.getCurrentConnectionType() ==
                          ConnectionType.hub) ...[
                        const SizedBox(
                          height: 1,
                        ),
                        ColoredBox(
                          color:
                              Colors.redAccent.withAlpha((0.9 * 255).toInt()),
                          child: ListTile(
                            leading: Iconify(
                              SimpleIcons.node_red,
                              color: colorScheme.surface,
                            ),
                            title: TextAtom(
                              'Open Node-RED of Hub',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                              ),
                            ),
                            onTap: () {
                              // final HubEntity? hubEntity =
                              //     IHubConnectionRepository.hubEntity;
                              // if (hubEntity != null &&
                              //     hubEntity.lastKnownIp.isValid()) {
                              //   final String lastKnownIp =
                              //       hubEntity.lastKnownIp.getOrCrash();
                              //   launchUrl(
                              //     Uri.parse('http://$lastKnownIp:1880'),
                              //     mode: LaunchMode.externalApplication,
                              //   );
                              // } else {
                              //   showDialog(
                              //     context: context,
                              //     builder: (_) => const AlertDialog(
                              //       title: TextAtom(
                              //         "Can't find Hub/Node-Red IP to connect to",
                              //       ),
                              //     ),
                              //   );
                              // }
                            },
                          ),
                        ),
                      ],
                      const SizedBox(
                        height: 1,
                      ),
                      ColoredBox(
                        color: Colors.orangeAccent,
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.info,
                            color: colorScheme.surface,
                          ),
                          title: TextAtom(
                            'Software Info',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                          ),
                          onTap: () {
                            context.router.push(const SoftwareInfoRoute());
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      ColoredBox(
                        color: Colors.greenAccent,
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.personThroughWindow,
                            color: colorScheme.surface,
                          ),
                          title: TextAtom(
                            'Log Out',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                          ),
                          onTap: () => _logout(context),
                        ),
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
