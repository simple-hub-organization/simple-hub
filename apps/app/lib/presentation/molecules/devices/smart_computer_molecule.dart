import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/molecules/molecules.dart';

/// object
class SmartComputerMolecule extends StatefulWidget {
  const SmartComputerMolecule(this.entity);

  final GenericSmartComputerDE entity;

  @override
  State<SmartComputerMolecule> createState() => _SmartComputerMoleculeState();
}

class _SmartComputerMoleculeState extends State<SmartComputerMolecule> {
  Future _suspendAllSmartComputers(List<String> smartComputersId) async {
    FlushbarHelper.createLoading(
      message: 'Suspending all Smart Computers',
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    // IDeviceRepository.instance.suspendDevices(deviDscesId: smartComputersId);
  }

  Future _shutdownAllSmartComputers(List<String> smartComputersId) async {
    FlushbarHelper.createLoading(
      message: 'Suspending all Smart Computers',
      linearProgressIndicator: const LinearProgressIndicator(),
    ).show(context);

    // IDeviceRepository.instance.shutdownDevices(devicesId: smartComputersId);
  }

  void suspendComputer(BuildContext context) {
    final String deviceId = widget.entity.getCbjEntityId;
    _suspendAllSmartComputers([deviceId]);
  }

  void shutdownComputer(BuildContext context) {
    final String deviceId = widget.entity.getCbjEntityId;
    _shutdownAllSmartComputers([deviceId]);
  }

  @override
  Widget build(BuildContext context) {
    return DeviceNameRowMolecule(
      widget.entity.cbjEntityName.getOrCrash()!,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
              suspendComputer(context);
            },
            child: Tab(
              icon: FaIcon(
                FontAwesomeIcons.moon,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
              child: TextAtom(
                'Sleep',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
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
              shutdownComputer(context);
            },
            child: Tab(
              icon: FaIcon(
                FontAwesomeIcons.powerOff,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
              child: TextAtom(
                'Shutdown',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
