import 'dart:io';

import 'package:cbj_integrations_controller/integrations_controller.dart';

class TurnPinOffWiringPiSetupPhys {
  Future<ProcessResult> turnThePinOff(String physicalPinNumber) async {
    return Process.run(
      '${SharedVariables().getProjectRootDirectoryPath()}/scripts/cScripts/phisicalComponents/sendingSignals/offSignal/turnOffWiringPiSetupPhys',
      [physicalPinNumber],
    );
  }
}
