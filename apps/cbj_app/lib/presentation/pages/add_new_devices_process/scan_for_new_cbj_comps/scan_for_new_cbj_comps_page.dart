import 'package:auto_route/auto_route.dart';
import 'package:cybearjinni/presentation/core/routes/app_router.gr.dart';
import 'package:cybearjinni/presentation/molecules/molecules.dart';
import 'package:cybearjinni/presentation/pages/add_new_devices_process/scan_for_new_cbj_comps/widgets/scan_for_new_cbj_comps_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class ScanForNewCBJCompsPage extends StatelessWidget {
  void leftIconFunction(BuildContext context) {
    context.router.replace(const ConnectToHomeWifiRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Colors.black87,
        child: Column(
          children: [
            TopBarMolecule(
              pageName: 'Add CBJ Devices',
              leftIcon: FontAwesomeIcons.arrowLeft,
              leftIconFunction: leftIconFunction,
            ),
            Expanded(
              child: ScanForNewCBJCompsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
