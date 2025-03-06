import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:security_bear/injection.config.dart';
import 'package:security_bear/utils.dart';

final getIt = GetIt.instance;

/// Saves the current environment for manual use
late String currentEnv;

@injectableInit
Future<void> configureInjection(String environment) async {
  currentEnv = environment;
  logger.i('Current environment name: $currentEnv');
  getIt.init(environment: environment);
}

abstract class Env {
  static const String test = 'test';
  static const String dev = 'dev';
  static const String prod = 'prod';
}
