import 'dart:io';

import 'package:security_bear/utils.dart';

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

    logger.i('This is the Pi Version: $piVersion');

    piVersion = piVersion.substring(piVersion.indexOf(':') + 2);

    piVersion = piVersion
        .substring(0, piVersion.indexOf('\n'))
        .replaceAll(' ', '_')
        .replaceAll('.', '_');

    return piVersion;
  }
}
