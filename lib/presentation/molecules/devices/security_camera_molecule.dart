import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:cybearjinni/presentation/core/routes/app_router.gr.dart';
import 'package:cybearjinni/presentation/molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Show switch toggles in a container with the background color from smart area
/// object
class SecurityCameraMolecule extends StatefulWidget {
  const SecurityCameraMolecule(this.entity);

  final GenericSecurityCameraDE entity;

  @override
  State<SecurityCameraMolecule> createState() => _SecurityCameraMoleculeState();
}

class _SecurityCameraMoleculeState extends State<SecurityCameraMolecule> {
  Future _openCameraPage() async {
    FlushbarHelper.createLoading(
      message: 'Opening Camera',
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    final String cameraIp = widget.entity.deviceLastKnownIp.getOrCrash()!;

    context.router
        .push(VideoStreamOutputContainerRoute(streamAddress: cameraIp));
  }

  @override
  Widget build(BuildContext context) {
    return DeviceNameRowMolecule(
      widget.entity.cbjEntityName.getOrCrash()!,
      TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            Colors.grey,
          ),
          side: WidgetStateProperty.all(
            BorderSide.lerp(
              const BorderSide(color: Colors.white60),
              const BorderSide(color: Colors.white60),
              22,
            ),
          ),
        ),
        onPressed: _openCameraPage,
        child: Tab(
          icon: FaIcon(
            FontAwesomeIcons.link,
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
          child: TextAtom(
            "Open Camera",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
