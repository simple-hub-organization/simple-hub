import 'dart:io';

import 'package:security_bear/infrastructure/core/my_singleton.dart';
import 'package:security_bear/infrastructure/system_commands/system_commands_base_class_d.dart';
import 'package:security_bear/infrastructure/system_commands/system_commands_manager_d.dart';

class CommonBashCommandsD implements SystemCommandsBaseClassD {
  @override
  Future<String> getCurrentUserName() async {
    // TODO: check if this can be done using
    // https://pub.dev/packages/flutter_gpiod or by using
    // https://pub.dev/packages/linux_system_info
    final String whoami =
        await Process.run('id', <String>['-nu']).then((ProcessResult result) {
      // whoami is getting permission error inside the snap
      // await Process.run('whoami', <String>[]).then((ProcessResult result) {
      return result.stdout.toString();
    });
    return whoami.trim();
  }

  @override
  Future<String> getUuidOfCurrentDevice() async {
    String df = await Process.run('df', <String>['-h', '/'])
        .then((ProcessResult result) {
      return result.stdout.toString();
    });

    df = df.substring(df.indexOf('\n') + 1);
    df = df.substring(0, df.indexOf(' '));

    //  The full bash command looks like this /sbin/blkid | grep "$(df -h / | sed -n 2p | cut -d" " -f1):" | grep -o "UUID=\"[^\"]*\" " | sed "s/UUID=\"//;s/\"//"
    String blkid =
        await Process.run('/sbin/blkid', []).then((ProcessResult result) {
      return result.stdout.toString();
    });

    if (blkid.contains(df)) {
      blkid = blkid.substring(blkid.indexOf(df));
    } else if (blkid.contains('/dev/mmcblk0p2')) {
      blkid = blkid.substring(blkid.indexOf('/dev/mmcblk0p2'));
    } else {
      blkid = blkid.substring(blkid.indexOf('/dev/'));
    }

    blkid = blkid.substring(0, blkid.indexOf('\n'));

    final String uuid = blkid.substring(blkid.indexOf('UUID="') + 6);
    return uuid.substring(0, uuid.indexOf('"'));
  }

  @override
  Future<String> getDeviceHostName() async {
    final String hostName = await Process.run('hostname', <String>['-s'])
        .then((ProcessResult result) {
//      String hostName = result.stdout;
//      hostName = hostName.substring(
//          0, hostName.length - 1); //  Removes the invisible new line at the end
//      print('Host name: ' + hostName);
      return result.stdout.toString();
    });
    return hostName.substring(0, hostName.indexOf('\n'));
  }

  @override
  Future<String?> getFileContent(String fileFullPath) async {
    final String fileContent = await Process.run('cat', <String>[fileFullPath])
        .then((ProcessResult result) {
      return result.stdout.toString();
    });

    if (fileContent == '') {
      return null;
    }
    return fileContent;
  }

  @override
  Future<String?> getDeviceConfiguration() {
    return getFileContent('/etc/cbjinni/deviceConfigs.txt');
  }

  @override
  Future<String> getAllEtcReleaseFilesText() {
    //TODO: add implementation, for now will return getDeviceHostName
    return getDeviceHostName();
  }

  @override
  Future<String> getLocalDbPath() async {
    String localDbFolderPath;
    final String? snapCommonEnvironmentVariablePath =
        await SystemCommandsManager().getSnapCommonEnvironmentVariable();

    if (snapCommonEnvironmentVariablePath == null) {
      final String? currentUserName = await MySingleton.getCurrentUserName();
      localDbFolderPath = '/home/$currentUserName/Documents/hive';
    } else {
      // /var/snap/cbj-hub/common/hive
      localDbFolderPath = '$snapCommonEnvironmentVariablePath/hive';
    }
    return localDbFolderPath;
  }
}
