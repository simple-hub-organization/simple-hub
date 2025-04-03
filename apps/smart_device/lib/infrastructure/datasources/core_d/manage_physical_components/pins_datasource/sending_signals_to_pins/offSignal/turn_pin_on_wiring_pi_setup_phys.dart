import 'dart:io';

import 'package:integrations_controller/integrations_controller.dart';

class TurnPinOffWiringPiSetupPhys {
  Future<ProcessResult> turnThePinOff(String physicalPinNumber) {
    return Process.run(
      '${SharedVariables().getProjectRootDirectoryPath()}/scripts/cScripts/phisicalComponents/sendingSignals/offSignal/turnOffWiringPiSetupPhys',
      [physicalPinNumber],
    );
  }
}
