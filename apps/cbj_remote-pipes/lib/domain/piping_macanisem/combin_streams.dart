import 'package:async/async.dart';
import 'package:cbj_remote_pipes/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';

/// Stores the
class PipItDown {
  /// Can have multiple app listeners for the hub streams
  static StreamGroup<RequestsAndStatusFromHub> hubsGroup =
      StreamGroup.broadcast();

  /// Can have multiple Hub listeners for the app streams
  static StreamGroup<ClientStatusRequests> clientsGroup =
      StreamGroup.broadcast();
}
