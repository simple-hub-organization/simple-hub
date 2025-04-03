import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/domain/connections_service.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/routes/app_router.gr.dart';
import 'package:simple_hub/presentation/organisms/organisms.dart';

@RoutePage()
class CommunicationMethodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? bssid = NetworksManager.instance.currentNetwork?.bssid;
    if (bssid == null) {
      return const TextAtom('(CommunicationMethodPage) Please set up network');
    }

    return PageOrganism(
      pageName: 'Communication type',
      child: Column(
        children: [
          const TextAtom('Chose communication Method'),
          TextAtom(
            'Current communication: ${ConnectionsService.getCurrentConnectionType()}',
          ),
          Expanded(
            child: Column(
              children: [
                ButtonAtom(
                  variant: ButtonVariant.highEmphasisFilled,
                  text: 'App as a Hub',
                  onPressed: () => ConnectionsService.setCurrentConnectionType(
                    networkBssid: bssid,
                    connectionType: ConnectionType.appAsHub,
                  ),
                ),
                ButtonAtom(
                  variant: ButtonVariant.highEmphasisFilled,
                  text: 'Hub',
                  onPressed: () {
                    ConnectionsService.setCurrentConnectionType(
                      networkBssid: bssid,
                      connectionType: ConnectionType.hub,
                    );
                    ConnectionsService.instance.connect();
                  },
                ),
                ButtonAtom(
                  variant: ButtonVariant.highEmphasisFilled,
                  text: 'Demo',
                  onPressed: () => ConnectionsService.setCurrentConnectionType(
                    networkBssid: bssid,
                    connectionType: ConnectionType.demo,
                  ),
                ),
              ],
            ),
          ),
          ButtonAtom(
            variant: ButtonVariant.highEmphasisFilled,
            text: 'Insert Remote Pipes',
            onPressed: () {
              context.router.push(const RemotePipesRoute());
            },
          ),
        ],
      ),
    );
  }
}
