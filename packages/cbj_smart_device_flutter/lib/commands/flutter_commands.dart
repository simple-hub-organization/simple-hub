import 'dart:io';

import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:path_provider/path_provider.dart';

class PhoneCommandsD extends SystemCommandsBaseClassD {
  String? currentUserName;
  String? currentDriveLetter;

  @override
  Future<String> getCurrentUserName() async {
    return 'cbj_app';
  }

  @override
  Future<String> getUuidOfCurrentDevice() async {
    return '000000000';
  }

  @override
  Future<String> getDeviceHostName() async {
    return '';
  }

  @override
  Future<String> getAllEtcReleaseFilesText() {
    return getDeviceHostName();
  }

  @override
  Future<String> getFileContent(String fileFullPath) async {
    throw UnimplementedError();
  }

  @override
  Future<String> getDeviceConfiguration() async {
    return '';
  }

  Future<String> getCurrentDriveLetter() async {
    return '';
  }

  Future<String> getOsDriveLetter() async {
    return '';
  }

  @override
  Future<String> getLocalDbPath() async {
    return (await getApplicationDocumentsDirectory()).path;
  }

  @override
  Future<String> getProjectFilesLocation() async {
    return Directory.current.path;
  }

  @override
  Future<String?> suspendComputer() {
    throw UnimplementedError();
  }

  @override
  Future<String?> shutdownComputer() async => null;

  @override
  Future<String?> getRaspberryPiDeviceVersion() async => null;
}
