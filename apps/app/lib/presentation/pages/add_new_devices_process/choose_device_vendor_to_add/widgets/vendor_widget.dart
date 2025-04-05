import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/core/routes/app_router.gr.dart';
import 'package:simple_hub/presentation/core/snack_bar_service.dart';

class VendorWidget extends StatelessWidget {
  const VendorWidget(this.vendorInformation);

  final VendorEntityInformation vendorInformation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (vendorInformation.loginType == VendorLoginTypes.notNeeded) {
          SnackBarService().show(
            context,
            '${vendorInformation.displayName} devices will be add automatically'
            ' for you',
          );
          return;
        }

        context.router
            .push(LoginVendorRoute(vendorInformation: vendorInformation));
      },
      child: Container(
        height: 100,
        color: HexColor('#C4C4C4').withAlpha((0.2 * 255).toInt()),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(vendorInformation.imageUrl),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            TextAtom(
              vendorInformation.displayName,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
