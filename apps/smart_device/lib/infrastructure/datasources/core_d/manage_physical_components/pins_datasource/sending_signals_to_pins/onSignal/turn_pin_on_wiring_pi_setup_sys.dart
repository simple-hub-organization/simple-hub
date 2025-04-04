import 'dart:io';

import 'package:integrations_controller/integrations_controller.dart';

class TurnPinOnWiringPiSetupSys {
  Future<ProcessResult> turnThePinOn(String physicalPinNumber) {
    return Process.run(
      '${SharedVariables().getProjectRootDirectoryPath()}/scripts/cScripts/phisicalComponents/sendingSignals/onSignal/turnOnWiringPiSetupSys',
      [physicalPinNumber],
    );
  }
}
