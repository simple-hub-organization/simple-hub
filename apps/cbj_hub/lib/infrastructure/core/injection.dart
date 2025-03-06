import 'package:cbj_hub/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getItCbj = GetIt.instance;

/// Saves the current environment for manual use
late String currentEnv;

@injectableInit
Future configureInjection(String environment) async {
  currentEnv = environment;
  logger.i('Current CyBear Jinni Hub environment name: $currentEnv');
  // getItCbj.init(environment: environment);
}

abstract class Env {
  static const String test = 'test';
  static const String devPc = 'dev_pc';
  static const String devPi = 'dev_pi';
  static const String prod = 'prod';

  /// Demo of the app with fake data
  static const String demo = 'demo';
}
