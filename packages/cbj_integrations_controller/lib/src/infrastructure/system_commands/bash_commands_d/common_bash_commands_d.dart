import 'dart:io';

import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/src/infrastructure/shared_variables.dart';
import 'package:cbj_integrations_controller/src/infrastructure/system_commands/bash_commands_d/bash_commands_for_raspberry_pi_d.dart';
import 'package:cbj_integrations_controller/src/infrastructure/system_commands/system_commands_base_class_d.dart';

class CommonBashCommandsD extends SystemCommandsBaseClassD {
  @override
  Future<String> getCurrentUserName() async {
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

    if (doesExistAndStringContainUuid(blkid, df)) {
      blkid = blkid.substring(blkid.indexOf(df));
    } else if (doesExistAndStringContainUuid(blkid, '/dev/mmcblk0p1')) {
      blkid = blkid.substring(blkid.indexOf('/dev/mmcblk0p1'));
    } else if (doesExistAndStringContainUuid(blkid, '/dev/mmcblk0p2')) {
      blkid = blkid.substring(blkid.indexOf('/dev/mmcblk0p2'));
    } else if (doesExistAndStringContainUuid(blkid, '/dev/zram0')) {
      blkid = blkid.substring(blkid.indexOf('/dev/zram0'));
    } else if (doesExistAndStringContainUuid(blkid, '/dev/zram1')) {
      blkid = blkid.substring(blkid.indexOf('/dev/zram1'));
    } else {
      blkid = blkid.substring(blkid.indexOf('/dev/'));
    }

    blkid = blkid.trim();

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
//      logger.t('Host name: ' + hostName);
      return result.stdout.toString();
    });
    return hostName.trim();
  }

  @override
  Future<String> getAllEtcReleaseFilesText() async {
    /// TODO: need to be replaced with echo $(cat /proc/device-tree/model) for nanopi
    String etcReleaseFiles = '';

    try {
      final List<FileSystemEntity> allContents =
          await Directory('/etc/').list().toList();

      final List<String> etcReleaseFilesNames = [];
      for (final FileSystemEntity f in allContents) {
        if (f.toString().contains('release')) {
          etcReleaseFilesNames.add(f.path);
        }
      }
      for (final String releaseContent in etcReleaseFilesNames) {
        // ignore: use_string_buffers
        etcReleaseFiles += File(releaseContent).readAsStringSync();
      }
    } catch (error) {
      icLogger.e(
        'Error getting all files from /etc/ that end with release\n$error',
      );
    }
    return etcReleaseFiles;
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

  bool doesExistAndStringContainUuid(String blkid, String driveName) {
    return blkid.contains(driveName) &&
        blkid.substring(blkid.indexOf(driveName)).contains('UUID="');
  }

  @override
  Future<String> getLocalDbPath() async {
    String localDbFolderPath;

    final String? snapCommonEnvironmentVariable =
        SharedVariables().getSnapCommonEnvironmentVariable();
    if (snapCommonEnvironmentVariable == null) {
      localDbFolderPath = '/home/${await getCurrentUserName()}/';
    } else {
      // /var/snap/cbj-hub/common/isar
      localDbFolderPath = snapCommonEnvironmentVariable;
    }
    return localDbFolderPath;
  }

  @override
  Future<String> getProjectFilesLocation() async {
    final String? snapLocation =
        SharedVariables().getSnapLocationEnvironmentVariable();
    if (snapLocation == null) {
      return Directory.current.path;
    }

    return snapLocation;
  }

  @override
  Future<String?> suspendComputer() async {
    // systemctl suspend does not work inside the snap
    // https://forum.snapcraft.io/t/error-executing-systemctl-suspend-inside-the-snap/32186/2

    final String commandResult = await Process.run('systemctl', ['suspend'])
        .then((ProcessResult result) {
      icLogger.i(
        'Suspend exit code ${result.exitCode}\nstddout:${result.stdout}\nstderr:${result.stderr}',
      );
      return result.stdout.toString();
    });

    if (commandResult == '') {
      return null;
    }
    return commandResult;
  }

  @override
  Future<String?> shutdownComputer() async {
    final String commandResult =
        await Process.run('poweroff', []).then((ProcessResult result) {
      // shutdown does not work inside the snap, testing power off
      // await Process.run('shutdown', ['now']).then((ProcessResult result) {
      // https://forum.snapcraft.io/t/error-executing-systemctl-suspend-inside-the-snap/32186/2
      // final String commandResult = await Process.run('sudo', ['shutdown'])
      icLogger.i(
        'Suspend exit code ${result.exitCode}\nstddout:${result.stdout}\nstderr:${result.stderr}',
      );
      return result.stdout.toString();
    });

    if (commandResult == '') {
      return null;
    }
    return commandResult;
  }

  @override
  Future<String?> getRaspberryPiDeviceVersion() =>
      BashCommandsForRaspberryPi.getRaspberryPiDeviceVersion();
}
