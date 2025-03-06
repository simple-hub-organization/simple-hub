import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/domain/connections_service.dart';
import 'package:simple_hub/infrastructure/core/logger.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/routes/app_router.gr.dart';

@RoutePage()
class ConnectToHubMorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              HexColor('#9355e5'),
              HexColor('#b162e4'),
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.center,
              child: const TextAtom(
                'More Connections Options',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Center(
                child: ConnectToHubMoreWidget(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () async {
                      context.router.maybePop();
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size(70, 30),
                      backgroundColor: HexColor('#985dc7'),
                      foregroundColor: Colors.white,
                    ),
                    child: const TextAtom(
                      'Back',
                      style: TextStyle(color: Colors.white),
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

class ConnectToHubMoreWidget extends StatefulWidget {
  @override
  State<ConnectToHubMoreWidget> createState() => _ConnectToHubMoreWidgetState();
}

class _ConnectToHubMoreWidgetState extends State<ConnectToHubMoreWidget> {
  bool isLoading = false;

  Future _connectInDemoMode() async {
    final String? bssid = NetworksManager().currentNetwork?.bssid;
    if (bssid == null) {
      logger.e('Please set up network');
      return;
    }

    ConnectionsService.setCurrentConnectionType(
      networkBssid: bssid,
      connectionType: ConnectionType.demo,
    );
    context.router.replace(const HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CircularProgressIndicatorAtom();
    }

    final Size screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Expanded(
                  child: ColoredBox(
                    color: HexColor('#985dc7'),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: const Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.globe,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Flexible(
                                child: TextAtom(
                                  'Connect to Remote Pipes',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: TextAtom(
                              'Currently not supported',
                              style: TextStyle(color: Colors.white),
                            ),
                            // BlocProvider(
                            //   create: (context) => getIt<HubInNetworkBloc>()
                            //     ..add(
                            //       const HubInNetworkEvent
                            //           .searchHubInNetwork(),
                            //     ),
                            //   child: CbjHubInNetwork(),
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: screenSize.height / 20,
        ),
        GestureDetector(
          onTap: () {
            _connectInDemoMode();
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: 60,
            color: HexColor('#985dc7'),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.vial,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white.withAlpha((0.9 * 255).toInt()),
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'Open Demo\n',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: 'Demo mod will not let you add or control '
                                'real smart home device!',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
