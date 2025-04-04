import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hub/infrastructure/core/injection.dart';
import 'package:hub/utils.dart';
import 'package:integrations_controller/integrations_controller.dart';

Future initializeIntegrationsController({
  required String? projectRootDirectoryPath,
  required String env,
}) async {
  configureInjection(env);

  try {
    if (projectRootDirectoryPath != null) {
      await SharedVariables().asyncConstructor(projectRootDirectoryPath);
    } else {
      await SharedVariables().asyncConstructor(Directory.current.path);
    }
  } catch (error) {
    logger.e('Path/argument 1 is not specified\n$error');
  }

  //  Setting device model and checking if configuration for this model exist
  setInstanceForDartNative();
  await DevicePinListManager().setPhysicalDeviceType();

  Hive.init(await dbPath());
  await IDbRepository.instance.asyncConstructor();
  networkHelper();
}

void networkHelper() {
  final NetworkObject network = NetworkObject(
    bssid: null,
    ssid: null,
    subNet: null,
    longitude: null,
    latitude: null,
    remotePipe: null,
    type: null,
    uniqueId: 'home',
  );
  NetworksManager.instance.addNetwork(network);
  NetworksManager.instance.setCurrentNetwork(network.uniqueId);
}

Future<String> dbPath() async {
  String? localDbPath =
      await SystemCommandsBaseClassD.instance.getLocalDbPath();

  if (localDbPath[localDbPath.length - 1] == '/') {
    localDbPath = localDbPath.substring(0, localDbPath.length - 1);
  }

  localDbPath += '/hive';

  logger.i('Hive db location\n$localDbPath');
  return localDbPath;
}
