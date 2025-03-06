import 'package:cbj_remote_pipes/infrastructure/hube_server/smart_server_u.dart';

/// Class to run the project and that will setup all the needed functions and
/// setups for the project to run correctly
class SetupPipes {
  /// First function in the program
  Future<void> main() async {
    final SmartServerU smartServerU = SmartServerU();
    smartServerU.startLocalServer();
  }
}
