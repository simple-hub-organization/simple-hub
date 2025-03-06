import 'dart:io';

import 'package:hub/application/boot_up.dart';
import 'package:hub/infrastructure/core/initialize_integrations_controller.dart';
import 'package:hub/infrastructure/core/injection.dart';
import 'package:hub/infrastructure/mqtt_server_repository.dart';
import 'package:integrations_controller/integrations_controller.dart';
import 'package:integrations_controller/src/infrastructure/node_red/node_red_repository.dart';

Future main(List<String> arguments) async {
  await MqttServerRepository().asyncConstructor();
  // CbjWebServerRepository();
  NodeRedRepository();
  SharedVariables()
      .asyncConstructor(arguments.firstOrNull ?? Directory.current.path);
  // arguments[0] is the location of the project
  await initializeIntegrationsController(
    projectRootDirectoryPath: arguments.firstOrNull ?? Directory.current.path,
    env: Env.devPc,
  );

  BootUp();
}
