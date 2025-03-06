import 'dart:io';

import 'package:cbj_hub/application/boot_up.dart';
import 'package:cbj_hub/infrastructure/core/initialize_integrations_controller.dart';
import 'package:cbj_hub/infrastructure/core/injection.dart';
import 'package:cbj_hub/infrastructure/mqtt_server_repository.dart';
import 'package:cbj_integrations_controller/integrations_controller.dart';

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
