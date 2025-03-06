import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/molecules/molecules.dart';
import 'package:simple_hub/presentation/pages/add_new_devices_process/connect_to_home_wifi/widgets/connect_to_home_wifi_widget.dart';

@RoutePage()
class ConnectToHomeWifiPage extends StatelessWidget {
  void backButtonFunction(BuildContext context) {
    context.router.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.06, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.grey,
              Colors.deepPurple,
            ],
          ),
        ),
        child: Column(
          children: [
            TopBarMolecule(
              pageName: 'Add Devices',
              leftIcon: FontAwesomeIcons.arrowLeft,
              leftIconFunction: backButtonFunction,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width - 20,
              decoration: const BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              alignment: Alignment.center,
              child: TextAtom(
                'Connect Hub To Home WiFi',
                style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ConnectToHomeWiFiWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
