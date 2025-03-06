import 'package:auto_route/auto_route.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/domain/connections_service.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:cybearjinni/presentation/core/routes/app_router.gr.dart';
import 'package:cybearjinni/presentation/organisms/organisms.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ComunicationMethodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? bssid = NetworksManager().currentNetwork?.bssid;
    if (bssid == null) {
      return const TextAtom('Please set up network');
    }

    return PageOrganism(
      pageName: 'Comunication type',
      child: Column(
        children: [
          const TextAtom('Chose comunication Method'),
          TextAtom(
            'Current comunication: ${ConnectionsService.getCurrentConnectionType()}',
          ),
          Expanded(
            child: Column(
              children: [
                ButtonWidgetAtom(
                  variant: ButtonVariant.primary,
                  text: 'App as a Hub',
                  onPressed: () => ConnectionsService.setCurrentConnectionType(
                    networkBssid: bssid,
                    connectionType: ConnectionType.appAsHub,
                  ),
                ),
                ButtonWidgetAtom(
                  variant: ButtonVariant.primary,
                  text: 'Hub',
                  onPressed: () {
                    ConnectionsService.setCurrentConnectionType(
                      networkBssid: bssid,
                      connectionType: ConnectionType.hub,
                    );
                    ConnectionsService.instance.connect();
                  },
                ),
                ButtonWidgetAtom(
                  variant: ButtonVariant.primary,
                  text: 'Demo',
                  onPressed: () => ConnectionsService.setCurrentConnectionType(
                    networkBssid: bssid,
                    connectionType: ConnectionType.demo,
                  ),
                ),
              ],
            ),
          ),
          ButtonWidgetAtom(
            variant: ButtonVariant.primary,
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
