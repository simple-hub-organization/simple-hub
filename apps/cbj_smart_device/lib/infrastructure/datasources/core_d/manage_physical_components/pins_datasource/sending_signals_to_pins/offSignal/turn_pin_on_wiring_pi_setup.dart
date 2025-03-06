import 'dart:io';

import 'package:cbj_integrations_controller/integrations_controller.dart';

class TurnPinOffWiringPiSetup {
  Future<ProcessResult> turnThePinOff(String physicalPinNumber) async {
    return Process.run(
      '${SharedVariables().getProjectRootDirectoryPath()}/scripts/cScripts/phisicalComponents/sendingSignals/offSignal/turnOffWiringPiSetup',
      [physicalPinNumber],
    );
  }
}
