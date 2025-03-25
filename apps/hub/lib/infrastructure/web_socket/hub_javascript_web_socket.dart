import 'dart:async';
import 'dart:convert';

import 'package:hub/utils.dart';
import 'package:integrations_controller/integrations_controller.dart';
import 'package:web_socket_channel/io.dart';

class HubJavascriptWebSocket {
  static HubJavascriptWebSocket? _instance;

  static HubJavascriptWebSocket get instance =>
      _instance ??= HubJavascriptWebSocket();

  static IOWebSocketChannel? channel;
  int retryDelay = 1;

  Future<void> connect() async {
    final Completer<void> completer = Completer<void>();

    while (true) {
      try {
        const String port = '9080';
        const url = 'ws://127.0.0.1:$port';
        channel = IOWebSocketChannel.connect(url);
        retryDelay = 1;
        channel?.stream.listen(
          _handleMessage,
          onError: _handleError,
          onDone: _onDone,
        );
        await completer.future;
      } catch (e) {
        logger.e('Failed to connect: $e');
        await _delayReconnect();
      }
    }
  }

  void _handleMessage(dynamic message) {
    final String messageAsString = message as String;
    try {
      final Map<String, dynamic> jsonData =
          jsonDecode(messageAsString) as Map<String, dynamic>;
      final DeviceEntityBase entity =
          DeviceEntityDtoBase.fromJson(jsonData).toDomain();

      final VendorConnectorConjectureService? connector =
          VendorsConnectorConjecture().getVendorConnectorConjecture(
        entity.cbjDeviceVendor.vendorsAndServices,
      );
      if (connector == null) {
        return;
      }

      if (entity.entityStateGRPC.state ==
          EntityStateGRPC.addNewEntityFromJavascriptHub) {
        VendorsConnectorConjecture().foundEntityOfVendor(
          vendorConnectorConjectureService: connector,
          entity: entity,
          entityCbjUniqueId: entity.entityCbjUniqueId.getOrCrash(),
        );
      }
    } catch (e) {
      logger.e('Error processing message: $e');
      return;
    }
  }

  void _handleError(dynamic error) {
    logger.e('WebSocket hub javascript error: $error');
    _delayReconnect();
  }

  void _onDone() {
    logger.i('Connection closed');
    _delayReconnect();
  }

  Future<void> _delayReconnect() async {
    logger.i('Reconnecting in $retryDelay seconds...');
    await Future.delayed(Duration(seconds: retryDelay));
    retryDelay = (retryDelay * 2).clamp(1, 30); // Exponential backoff (max 30s)
  }

  void addDevice(VendorLoginEntity loginEntity) {
    final Map<String, dynamic> loginJson =
        loginEntity.toInfrastructure().toJson();
    loginJson.addEntries([MapEntry('event', VendorLoginEntity.event)]);
    final String massage = jsonEncode(loginJson);
    sendMessage(massage);
  }

  void setState(RequestActionObject requestAction) {
    final Map<String, dynamic> json = requestAction.toInfrastructure().toJson();
    json.addEntries([MapEntry('event', RequestActionObject.event)]);
    final String massage = jsonEncode(json);
    sendMessage(massage);
  }

  void sendMessage(String massage) => channel?.sink.add(massage);
}
