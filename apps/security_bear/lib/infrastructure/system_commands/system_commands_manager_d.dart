import 'dart:io';

import 'package:security_bear/infrastructure/core/shared_variables.dart';
import 'package:security_bear/infrastructure/system_commands/bash_commands_d/bash_commands_for_raspberry_pi_d.dart';
import 'package:security_bear/infrastructure/system_commands/bash_commands_d/common_bash_commands_d.dart';
import 'package:security_bear/infrastructure/system_commands/batch_commands_d/common_batch_commands_d.dart';
import 'package:security_bear/infrastructure/system_commands/system_commands_base_class_d.dart';
import 'package:security_bear/utils.dart';

/// Execute commands natively on the running os
class SystemCommandsManager {
  /// Detect current os and set the suitable os object to use when executing
  /// commands
  SystemCommandsManager() {
    if (Platform.isLinux) {
      logger.v('Linux platform detected in SystemCommandsManager');
      systemCommandsBaseClassD = CommonBashCommandsD();
    } else if (Platform.isWindows) {
      logger.v('Windows platform detected in SystemCommandsManager');
      systemCommandsBaseClassD = CommonBatchCommandsD();
    } else if (Platform.isMacOS) {
      logger.w('Mac os is currently not supported in SystemCommandsManager');
      throw 'Mac os is currently not supported';
    } else {
      logger.w(
        '${Platform.operatingSystem} os is not supported in SystemCommandsManager',
      );
      throw '${Platform.operatingSystem} os is not supported';
    }
  }

  SystemCommandsBaseClassD? systemCommandsBaseClassD;

  Future<String> getCurrentUserName() {
    return systemCommandsBaseClassD!.getCurrentUserName();
  }

  Future<String> getLocalDbPath() {
    return systemCommandsBaseClassD!.getLocalDbPath();
  }

  Future<String> getDeviceHostName() {
    return systemCommandsBaseClassD!.getDeviceHostName();
  }

  Future<String> getAllEtcReleaseFilesText() {
    return systemCommandsBaseClassD!.getAllEtcReleaseFilesText();
  }

  Future<String?> getFileContent(String fileFullPath) {
    return systemCommandsBaseClassD!.getFileContent(fileFullPath);
  }

  Future<String> getUuidOfCurrentDevice() {
    return systemCommandsBaseClassD!.getUuidOfCurrentDevice();
  }

  Future<String?> getDeviceConfiguration() {
    return systemCommandsBaseClassD!.getDeviceConfiguration();
  }

  Future<String?> getRaspberryPiDeviceVersion() {
    return BashCommandsForRaspberryPi.getRaspberryPiDeviceVersion();
  }

  Future<String> getSnapLocationEnvironmentVariable() {
    return Future.value(SharedVariables.getSnapLocationEnvironmentVariable());
  }

  Future<String?> getSnapCommonEnvironmentVariable() {
    return Future.value(SharedVariables.getSnapCommonEnvironmentVariable());
  }

  Future<String> getSnapUserCommonEnvironmentVariable() {
    return Future.value(SharedVariables.getSnapUserCommonEnvironmentVariable());
  }
}
