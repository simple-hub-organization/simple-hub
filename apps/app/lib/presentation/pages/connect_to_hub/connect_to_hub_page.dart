import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/routes/app_router.gr.dart';
import 'package:simple_hub/presentation/pages/connect_to_hub/widgets/cbj_hub_in_network_widget.dart';

@RoutePage()
class ConnectToHubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

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
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: const TextAtom(
                              'Connect to Hub',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
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
                                          FontAwesomeIcons.networkWired,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Flexible(
                                          child: TextAtom(
                                            'Search devices in your network',
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
                                      child: CbjHubInNetworkWidget(),
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
                      context.router.push(const ConnectToHomeWifiRoute());

                      // Fluttertoast.showToast(
                      //   msg: 'Connecting Hub to wireless network is not supported',
                      //   toastLength: Toast.LENGTH_SHORT,
                      //   gravity: ToastGravity.SNACKBAR,
                      //   backgroundColor: Colors.lightBlue,
                      //   textColor: Theme.of(context).textTheme.bodyLarge!.color,
                      //   fontSize: 16.0,
                      // );
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
                              FontAwesomeIcons.wifi,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.white
                                        .withAlpha((0.9 * 255).toInt()),
                                  ),
                                  /*defining default style is optional */
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: 'Wireless Network\n',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    TextSpan(
                                      text:
                                          'Connect a CyBear Jinni Hub to WiFi '
                                          'network',
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
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      context.router.push(const SmartCameraContainerRoute());
                      // IHubConnectionRepository.instance.closeConnection();
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
                              FontAwesomeIcons.camera,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.white
                                        .withAlpha((0.9 * 255).toInt()),
                                  ),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: 'Security Camera\n',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    TextSpan(
                                      text:
                                          'Transform your phone into a smart security camera',
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
                            context.router.push(const ConnectToHubMoreRoute());
                          },
                          style: TextButton.styleFrom(
                            minimumSize: const Size(70, 30),
                            backgroundColor: HexColor('#985dc7'),
                          ),
                          child: const TextAtom(
                            'More',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
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
