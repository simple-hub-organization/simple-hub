import 'package:security_bear/infrastructure/system_commands/system_commands_manager_d.dart';

class MySingletonHelper {
  static Future<String> getUuid() {
    final SystemCommandsManager systemCommandsManager = SystemCommandsManager();
    return systemCommandsManager.getUuidOfCurrentDevice();
  }

  static Future<String> getCurrentUserName() {
    final SystemCommandsManager systemCommandsManager = SystemCommandsManager();
    return systemCommandsManager.getCurrentUserName();
  }

  static Future<String> getLocalDbPath() {
    final SystemCommandsManager systemCommandsManager = SystemCommandsManager();
    return systemCommandsManager.getLocalDbPath();
  }
}
