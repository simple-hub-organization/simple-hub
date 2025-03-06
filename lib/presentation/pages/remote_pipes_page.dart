import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:auto_route/auto_route.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/domain/connections_service.dart';
import 'package:cybearjinni/infrastructure/core/logger.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:cybearjinni/presentation/core/snack_bar_service.dart';
import 'package:cybearjinni/presentation/molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class RemotePipesPage extends StatelessWidget {
  /// Execute when remote pipes press the icon in top right side
  void userCogFunction(BuildContext context) {
    showAdaptiveActionSheet(
      context: context,
      actions: <BottomSheetAction>[
        BottomSheetAction(
          title: const TextAtom(
            '➕ Add remote pipes',
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
            pageName: 'Remote Pipes',
            rightIconFunction: userCogFunction,
            leftIcon: FontAwesomeIcons.arrowLeft,
            leftIconFunction: leftIconFunction,
          ),
          Expanded(
            child: RemotePipesWidget(),
          ),
        ],
      ),
    );
  }
}

/// Show light toggles in a container with the background color from smart area
/// object
class RemotePipesWidget extends StatefulWidget {
  @override
  State<RemotePipesWidget> createState() => _RemotePipesWidgetState();
}

class _RemotePipesWidgetState extends State<RemotePipesWidget> {
  String? remotePipesDomainName;

  Future _remotePipesDomainChanged(String value) async {
    setState(() {
      remotePipesDomainName = value;
    });
  }

  Future _addRemotePipeUrl() async {
    if (remotePipesDomainName == null || remotePipesDomainName!.isEmpty) {
      return;
    }
    final String? bssid = NetworksManager().currentNetwork?.bssid;
    if (bssid == null) {
      logger.e('Please set up network');
      return;
    }
    ConnectionsService.setCurrentConnectionType(
      networkBssid: bssid,
      connectionType: ConnectionType.remotePipes,
    );
    ConnectionsService.instance.connect(address: remotePipesDomainName);
    context.router.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextAtom(
            'Please insert the Remote Pipes domain',
          ),
          const SizedBox(
            height: 60,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: FaIcon(FontAwesomeIcons.globe),
              labelText: 'Remote Pipes domain',
            ),
            autocorrect: false,
            onChanged: _remotePipesDomainChanged,
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              SnackBarService().show(
                context,
                'Sending domain name to the Hub',
              );
              _addRemotePipeUrl();
            },
            child: const TextAtom('Connect'),
          ),
        ],
      ),
    );
  }
}
