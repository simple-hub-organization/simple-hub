import 'dart:io';

import 'package:cbj_integrations_controller/integrations_controller.dart';

class TurnPinOffWiringPiSetupSys {
  Future<ProcessResult> turnThePinOff(String physicalPinNumber) async {
    return Process.run(
      '${SharedVariables().getProjectRootDirectoryPath()}/scripts/cScripts/phisicalComponents/sendingSignals/offSignal/turnOffWiringPiSetupSys',
      [physicalPinNumber],
    );
  }
}
