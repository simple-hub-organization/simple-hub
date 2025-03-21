import 'dart:io';

import 'package:integrations_controller/integrations_controller.dart';

class TurnPinOnWiringPiSetup {
  Future<ProcessResult> turnThePinOn(String physicalPinNumber) async {
    return Process.run(
      '${SharedVariables().getProjectRootDirectoryPath()}/scripts/cScripts/phisicalComponents/sendingSignals/onSignal/turnOnWiringPiSetup',
      [physicalPinNumber],
    );
  }
}
