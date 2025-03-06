import 'package:grpc/grpc.dart';
import 'package:security_bear/features/security_bear/application/usecases/network_actions/network_actions.dart';
import 'package:security_bear/features/security_bear/application/usecases/security_bear_server_u/security_bear_server_u.dart';
import 'package:security_bear/features/security_bear/infrastructure/core/network_entity.dart';
import 'package:security_bear/infrastructure/core/helper_methods.dart';
import 'package:security_bear/injection.dart';
import 'package:security_bear/utils.dart';

/// This class is where all the program start after the main file
class SecurityBearManagerU {

  SecurityBearManagerU() {
    securityBearMainAsync();
  }
  /// Port for the security bear server to get opened on
  static late int securityBearServerPort;

  final NetworkEntity firstAndAdminNetworkDefault =
      NetworkEntity(networkName: 'CyBear Jinni', networkPass: 'CyBear Jinni');

  final NetworkEntity secondNetworkDefault = NetworkEntity(
      networkName: 'CyBear_Jinni Jinni', networkPass: 'CyBear_Jinni Jinni',);

  Future<void> securityBearMainAsync() async {
    logger.i('Device local IP: ${await getIps()}');

    createServer();
    connectToDatabase();

    manegeNetworkConnection();
  }

  ///  This function starts the object
  ///  to manege the state of the device network connection
  Future<void> manegeNetworkConnection() async {
    final NetworkActions networkActions =
        NetworkActions(firstAndAdminNetworkDefault, secondNetworkDefault);

    await networkActions.connectToAdminWhenExist();
  }

  /// This function connect to the data base
  void connectToDatabase() {}

  ///  This function will create the server in case there is connection
  Future<void> createServer() async {
    final server = Server([SecurityBearServerU()]);
    if (currentEnv == Env.prod) {
      securityBearServerPort = 50052;
    } else {
      securityBearServerPort = 60052;
    }
    await server.serve(port: securityBearServerPort);
    logger.i('Server listening on port ${server.port}...');
  }
}
