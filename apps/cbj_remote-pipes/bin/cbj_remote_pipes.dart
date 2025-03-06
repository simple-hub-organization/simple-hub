import 'package:cbj_remote_pipes/domain/setup_pipes.dart';
import 'package:cbj_remote_pipes/utils.dart';

void main(List<String> arguments) {
  logger.i('Current Remote Pipes environment name: prod');
  final SetupPipes setupPipes = SetupPipes();
  setupPipes.main();
}
