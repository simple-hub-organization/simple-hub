import 'package:another_flushbar/flushbar_helper.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:cybearjinni/presentation/molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

/// Show switch toggles in a container with the background color from smart area
/// object
class PrinterMolecule extends StatefulWidget {
  const PrinterMolecule(this.entity);

  final GenericPrinterDE entity;

  @override
  State<PrinterMolecule> createState() => _PrinterMoleculeState();
}

class _PrinterMoleculeState extends State<PrinterMolecule> {
  Future _openPrintersWebPage() async {
    FlushbarHelper.createLoading(
      message: 'Opening printers Web Page',
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    final String printerAddress = widget.entity.srvTarget.getOrCrash() ??
        widget.entity.deviceLastKnownIp.getOrCrash()!;
    launchUrl(
      Uri.parse('http://$printerAddress'),
      mode: LaunchMode.externalApplication,
    );
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
        onPressed: () {
          _openPrintersWebPage();
        },
        child: Tab(
          icon: FaIcon(
            FontAwesomeIcons.link,
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
          child: TextAtom(
            "Open Printer's Web Page",
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
