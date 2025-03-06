import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:hub/infrastructure/remote_pipes/device_helper_methods.dart';
import 'package:hub/utils.dart';
import 'package:integrations_controller/integrations_controller.dart';

class RequestsHelper {
  static void streamFromApp({
    required Stream<ClientStatusRequests> request,
    required String requestUrl,
  }) {
    final StreamSubscription<ClientStatusRequests> clientStream =
        request.listen(DeviceHelperMethods().handleClientStatusRequests);
    clientStream.onError((error) {
      if (error is GrpcError && error.code == 1) {
        logger.t('Client have disconnected');
      } else if (error is GrpcError && error.code == 14) {
        final String errorMessage = error.message!;

        if (error.message == null) {
          logger.e('Client stream error without message\n$error');
        } else if (!errorMessage.contains('errorCode: 0')) {
          logger.i('Closing last stream\n$error');
        }

        /// Request reached the internet but the didn't arrive to remote pipes
        /// service
        else if (!errorMessage.contains('errno = -2')) {
          logger.e(
            'Remote Pipes service does not exist, check URL\n'
            '$error',
          );
        }

        /// Request didn't reached the internet
        else if (!errorMessage.contains('errno = -3')) {
          logger.w(
            'Entity does not have network\n'
            '$error',
          );
          // startRemotePipesWhenThereIsConnectionToWww(requestUrl);
          return;
        }
        logger.e(
          'Un none errno number\n'
          '$error',
        );
      } else {
        if (error is GrpcError &&
            error.message != null &&
            !error.message!.contains('errorCode: 0')) {
          logger.i('Client stream got terminated to create new one\n$error');
          // startRemotePipesWhenThereIsConnectionToWww(requestUrl);
          return;
        }
        logger.e('Client stream error\n$error');
      }
    });
    clientStream.onDone(() {
      clientStream.cancel();
    });
  }
}
