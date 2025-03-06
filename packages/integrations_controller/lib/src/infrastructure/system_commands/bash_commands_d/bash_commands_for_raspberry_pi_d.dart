import 'dart:io';

import 'package:integrations_controller/src/infrastructure/core/utils.dart';

class BashCommandsForRaspberryPi {
  static Future<String?> getRaspberryPiDeviceVersion() async {
    String piVersion = await Process.run('cat', <String>['/proc/cpuinfo'])
        .then((ProcessResult result) {
      return result.stdout.toString();
    });

    if (!piVersion.contains('Model')) {
      return null;
    }
    piVersion = piVersion.substring(piVersion.indexOf('Model'));

    icLogger.t('This is the Pi Version: $piVersion');

    piVersion = piVersion.substring(piVersion.indexOf(':') + 2);

    piVersion = piVersion.trim().replaceAll(' ', '_').replaceAll('.', '_');

    return piVersion;
  }
}
