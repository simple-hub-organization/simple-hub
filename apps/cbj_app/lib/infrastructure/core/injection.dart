import 'package:cybearjinni/infrastructure/core/injection.config.dart';
import 'package:cybearjinni/infrastructure/core/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

/// Saves the current environment for manual use
late String currentEnvApp;

@injectableInit
void configureDependencies(String env) {
  currentEnvApp = env;
  logger.i('Current CyBear Jinni App environment name: $currentEnvApp');
  getIt.init(environment: env);
}

abstract class EnvApp {
  static const String test = 'test';
  static const String dev = 'dev';
  static const String prod = 'prod';

  /// Demo of the app with fake data
  static const String demo = 'demo';
}
