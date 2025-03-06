import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/molecules/molecules.dart';
import 'package:simple_hub/presentation/pages/add_new_devices_process/choose_device_vendor_to_add/widgets/vendors_list.dart';

@RoutePage()
class ChooseDeviceVendorToAddPage extends StatelessWidget {
  void backButtonFunction(BuildContext context) {
    context.router.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBarMolecule(
            pageName: 'Add Service',
            rightIconFunction: backButtonFunction,
            leftIcon: FontAwesomeIcons.arrowLeft,
            leftIconFunction: backButtonFunction,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            alignment: Alignment.centerLeft,
            child: const TextAtom(
              'Vendors:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: VendorsList(),
          ),
          const SizedBox(
            height: 50,
            child: TextAtom(''),
          ),
        ],
      ),
    );
  }
}
