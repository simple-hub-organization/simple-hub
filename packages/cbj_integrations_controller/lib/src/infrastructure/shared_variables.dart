import 'dart:io';

import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';

// TODO: maybe can get merged into SystemCommandsBaseClassD
class SharedVariables {
  factory SharedVariables() => _instance;

  SharedVariables._singletonConstructor() {
    icLogger.i('PATH: $_projectRootDirectoryPath');
  }

  static final SharedVariables _instance =
      SharedVariables._singletonConstructor();

  ///  Save the location of all the files that were created during the snapcraft
  String? _projectRootDirectoryPath;

  Future asyncConstructor(String projectRootDirectoryPath) async {
    _projectRootDirectoryPath = projectRootDirectoryPath;
    icLogger.t('PATH: $_projectRootDirectoryPath');
  }

  String? getProjectRootDirectoryPath() => _projectRootDirectoryPath;

  /// Getting snap location environment variable value of $SNAP
  String? getSnapLocationEnvironmentVariable() {
    if (_projectRootDirectoryPath == null ||
        !_projectRootDirectoryPath!.contains('/snap/')) {
      return null;
    }
    return '/snap/cbj-hub/current';
  }

  /// Getting snap common environment variable value of SNAP_COMMON
  String? getSnapCommonEnvironmentVariable() {
    if (_projectRootDirectoryPath == null ||
        !_projectRootDirectoryPath!.contains('/snap/')) {
      return null;
    }
    return '/var/snap/cbj-hub/common';
  }

  /// Getting snap user common environment variable, value of $SNAP_USER_COMMON
  String? getSnapUserCommonEnvironmentVariable() {
    if (_projectRootDirectoryPath == null ||
        !_projectRootDirectoryPath!.contains('/snap/')) {
      return null;
    }
    return '/root/snap/cbj-hub/common';
  }

  ///  Get Ip info
  Future<String?> getIps() async {
    for (final NetworkInterface interface in await NetworkInterface.list()) {
//      print('== Interface: ${interface.name} ==');
      for (final InternetAddress address in interface.addresses) {
//        print(
//            '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');
        return address.address;
      }
    }
    return null;
  }
}
