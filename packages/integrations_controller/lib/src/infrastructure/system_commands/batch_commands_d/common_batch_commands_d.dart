import 'dart:io';

import 'package:integrations_controller/src/infrastructure/core/utils.dart';
import 'package:integrations_controller/src/infrastructure/system_commands/system_commands_base_class_d.dart';

class CommonBatchCommandsD extends SystemCommandsBaseClassD {
  String? currentUserName;
  String? currentDriveLetter;

  @override
  Future<String> getCurrentUserName() async {
    if (currentUserName != null) {
      return currentUserName!;
    }
    final String whoAmI =
        await Process.run('cmd', <String>['/C', 'echo', '%username%'])
            .then((ProcessResult result) {
      return result.stdout.toString();
    });
    currentUserName = whoAmI.substring(0, whoAmI.indexOf('\r'));
    return currentUserName!;
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
  Future<String> getAllEtcReleaseFilesText() {
    //TODO: add implementation, for now will return getDeviceHostName
    return getDeviceHostName();
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
      icLogger.w(
        'Config file does not exist or empty, path searching: $fileFullPath',
      );
      return '';
    }
    return fileContent.substring(0, fileContent.indexOf('\r'));
  }

  Future<String> getCurrentDriveLetter() async {
    if (currentDriveLetter != null) {
      return currentDriveLetter!;
    }

    final String driveLetter;
    driveLetter = await Process.run(
      'cmd',
      <String>['/C', 'echo', '%cd:~0,2%'],
    ).then((ProcessResult result) {
      return result.stdout.toString();
    });

    currentDriveLetter = driveLetter.substring(0, driveLetter.indexOf('\r'));

    return currentDriveLetter!;
  }

  //TODO: Currently does not work as echo %~dp0 will not work at the command
  // line, only in a batch file.
  Future<String> getOsDriveLetter() async {
    final String driveLetter =
        await Process.run('cmd', <String>['/C', 'echo', '%~d0'])
            .then((ProcessResult result) {
      return result.stdout.toString();
    });
    return driveLetter.substring(0, driveLetter.indexOf('\r'));
  }

  @override
  Future<String> getLocalDbPath() async {
    final String cbjFullPath = (await getCurrentDriveLetter()) +
        r'\Users\' +
        (await getCurrentUserName()) +
        r'\Documents\cbjinni\'; // Will only work if the program located in the os driver
    return cbjFullPath;
  }

  @override
  Future<String> getProjectFilesLocation() async => Directory.current.path;

  @override
  Future<String?> suspendComputer() async => null;

  @override
  Future<String?> shutdownComputer() async => null;

  @override
  Future<String?> getRaspberryPiDeviceVersion() async => null;
}
