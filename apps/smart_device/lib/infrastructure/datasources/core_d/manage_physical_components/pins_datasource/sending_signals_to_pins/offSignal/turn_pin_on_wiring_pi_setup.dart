import 'dart:io';

import 'package:integrations_controller/integrations_controller.dart';

class TurnPinOffWiringPiSetup {
  Future<ProcessResult> turnThePinOff(String physicalPinNumber) {
    return Process.run(
      '${SharedVariables().getProjectRootDirectoryPath()}/scripts/cScripts/phisicalComponents/sendingSignals/offSignal/turnOffWiringPiSetup',
      [physicalPinNumber],
    );
  }
}
