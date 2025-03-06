import 'dart:io';

import 'package:cbj_integrations_controller/integrations_controller.dart';

class TurnPinOnWiringPiSetupSys {
  Future<ProcessResult> turnThePinOn(String physicalPinNumber) async {
    return Process.run(
      '${SharedVariables().getProjectRootDirectoryPath()}/scripts/cScripts/phisicalComponents/sendingSignals/onSignal/turnOnWiringPiSetupSys',
      [physicalPinNumber],
    );
  }
}
