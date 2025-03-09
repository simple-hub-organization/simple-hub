import 'dart:io';

import 'package:security_bear/infrastructure/system_commands/system_commands_base_class_d.dart';
import 'package:security_bear/utils.dart';

class CommonBatchCommandsD implements SystemCommandsBaseClassD {
  @override
  Future<String> getCurrentUserName() async {
    final String whoami =
        await Process.run('cmd', <String>['/C', 'echo', '%username%'])
            .then((ProcessResult result) {
      return result.stdout.toString();
    });
    return whoami.substring(0, whoami.indexOf('\r'));
  }

  @override
  Future<String> getUuidOfCurrentDevice() async {
    final String uuid = await Process.run('cmd', <String>[
      '/C',
      'wmic',
      'path',
      'win32_computersystemproduct',
      'get',
      'uuid',
    ]).then((ProcessResult result) {
      return result.stdout.toString();
    });
    return uuid
        .substring(uuid.indexOf('\n') + 1)
        .substring(0, uuid.indexOf('\r'))
        .substring(0, uuid.indexOf(' '));
  }

  @override
  Future<String> getDeviceHostName() async {
    final String hostName =
        await Process.run('cmd', <String>['/C', 'echo', '%COMPUTERNAME%'])
            .then((ProcessResult result) {
      return result.stdout.toString();
    });
    return hostName.substring(0, hostName.indexOf('\r'));
  }

  @override
  Future<String> getFileContent(String fileFullPath) async {
    final String fileText = await Process.run(
      'cmd',
      <String>['/C', 'more', fileFullPath],
    ).then((ProcessResult result) {
      return result.stdout.toString();
    });
    return fileText;
  }

  @override
  Future<String> getDeviceConfiguration() async {
    // String fileFullPath = (await getOsDriveLetter())  + r'\Users\' + (await getCurrentUserName()) + r'\Documents\cbjinni\deviceConfigs.txt'; // Needed to fix function getOsDriveLetter before
    final String fileFullPath = (await getCurrentDriveLetter()) +
        r'\Users\' +
        (await getCurrentUserName()) +
        r'\Documents\cbjinni\deviceConfigs.txt'; // Will only work if the program located in the os driver

    String fileContent = await getFileContent(fileFullPath);
    if (fileContent.isEmpty) {
      // Windows is weird and needs help
      fileContent = await getFileContent('$fileFullPath.txt');
    }
    if (fileContent.isEmpty) {
      logger.i(
        'Config file does not exist or empty, path searching: $fileFullPath',
      );
      return '';
    }
    return fileContent.substring(0, fileContent.indexOf('\r'));
  }

  Future<String> getCurrentDriveLetter() async {
    final String driveLetter =
        await Process.run('cmd', <String>['/C', 'echo', '%cd:~0,2%'])
            .then((ProcessResult result) {
      return result.stdout.toString();
    });
    return driveLetter.substring(0, driveLetter.indexOf('\r'));
  }

  //TODO: Currently does not work as echo %~dp0 will not work at the command line, only in a batch file.
  Future<String> getOsDriveLetter() async {
    final String driveLetter =
        await Process.run('cmd', <String>['/C', 'echo', '%~d0'])
            .then((ProcessResult result) {
      return result.stdout.toString();
    });
    return driveLetter.substring(0, driveLetter.indexOf('\r'));
  }

  @override
  Future<String> getAllEtcReleaseFilesText() {
    //TODO: add implementation, for now will return getDeviceHostName
    return getDeviceHostName();
  }

  @override
  Future<String> getLocalDbPath() async {
    final String cbjFullPath = (await getCurrentDriveLetter()) +
        r'\Users\' +
        (await getCurrentUserName()) +
        r'\Documents\cbjinni\'; // Will only work if the program located in the os driver
    return cbjFullPath;
  }
}
