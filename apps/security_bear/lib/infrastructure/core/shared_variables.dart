import 'package:security_bear/utils.dart';

class SharedVariables {
  SharedVariables(String projectRootDirectoryPath) {
    _projectRootDirectoryPath = projectRootDirectoryPath;
    logger.i('PATH: $_projectRootDirectoryPath');
  }

  ///  Save the location of all the files that were created during the snapcraft
  static String? _projectRootDirectoryPath;

  static String? getProjectRootDirectoryPath() => _projectRootDirectoryPath;

  /// Getting snap location environment variable value of $SNAP
  static String? getSnapLocationEnvironmentVariable() {
    if (_projectRootDirectoryPath == null ||
        !_projectRootDirectoryPath!.contains('/snap/')) {
      return null;
    }
    return '/snap/security-bear/current';
  }

  /// Getting snap common environment variable value of SNAP_COMMON
  static String? getSnapCommonEnvironmentVariable() {
    if (_projectRootDirectoryPath == null ||
        !_projectRootDirectoryPath!.contains('/snap/')) {
      return null;
    }
    return '/var/snap/security-bear/common';
  }

  /// Getting snap user common environment variable, value of $SNAP_USER_COMMON
  static String? getSnapUserCommonEnvironmentVariable() {
    if (_projectRootDirectoryPath == null ||
        !_projectRootDirectoryPath!.contains('/snap/')) {
      return null;
    }
    return '/root/snap/security-bear/common';
  }
}
