import 'dart:io';

import 'package:cbj_integrations_controller/integrations_controller.dart';

class TurnPinOnWiringPiSetupPhys {
  Future<ProcessResult> turnThePinOn(String physicalPinNumber) async {
    return Process.run(
      '${SharedVariables().getProjectRootDirectoryPath()}/scripts/cScripts/phisicalComponents/sendingSignals/onSignal/turnOnWiringPiSetupPhys',
      <String>[physicalPinNumber],
    );
  }
}
