import 'package:remote_pipes_router/domain/setup_pipes.dart';
import 'package:remote_pipes_router/utils.dart';

Future<void> main(List<String> arguments) async {
  logger.i('Current Remote Pipes Router environment name: prod');

  // final ServerSocket server =
  //     await ServerSocket.bind(InternetAddress.anyIPv4, 5004);
  //
  // final Socket socket = await server.first;
  // RemotePipesClient.createStreamWithHub(
  //   socket.remoteAddress.address,
  //   50051,
  //   socket,
  // );

  final SetupPipes setupPipes = SetupPipes();
  setupPipes.main();
}
