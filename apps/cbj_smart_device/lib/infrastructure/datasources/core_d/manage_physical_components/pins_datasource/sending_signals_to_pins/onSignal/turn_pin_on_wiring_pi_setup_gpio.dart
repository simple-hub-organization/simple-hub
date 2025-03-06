import 'dart:io';

import 'package:cbj_integrations_controller/integrations_controller.dart';

class TurnPinOnWiringPiSetupGpio {
  Future<ProcessResult> turnThePinOn(String physicalPinNumber) async {
    return Process.run(
      '${SharedVariables().getProjectRootDirectoryPath()}/scripts/cScripts/phisicalComponents/sendingSignals/onSignal/turnOnWiringPiSetupGpio',
      [physicalPinNumber],
    );
  }
}
