import 'package:cybear_jinni_site/injection.config.dart';
import 'package:cybear_jinni_site/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

/// Saves the current environment for manual use
late String currentEnv;

@injectableInit
void configureDependencies(String env) {
  currentEnv = env;
  logger.i('Current CyBear Jinni Site environment name: $currentEnv');
  $initGetIt(getIt, environment: env);
}

abstract class Env {
  static const String test = 'test';
  static const String dev = 'dev';
  static const String prod = 'prod';

  /// Demo of the app with fake data
  static const String demo = 'demo';
}
