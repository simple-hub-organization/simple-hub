import 'dart:convert';

import 'package:cbj_hub/utils.dart';
import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:web_socket_channel/io.dart';

class HubJavascriptWebSocket {
  static HubJavascriptWebSocket? _instance;

  static HubJavascriptWebSocket get instance =>
      _instance ??= HubJavascriptWebSocket();

  static IOWebSocketChannel? channel;

  Future<void> connect() async {
    const String port = '9080';
    const url = 'ws://127.0.0.1:$port';
    channel = IOWebSocketChannel.connect(url);

    channel?.stream.listen(
      (message) {
        final String messageAsString = message as String;
        try {
          final Map<String, dynamic> jsonData =
              jsonDecode(messageAsString) as Map<String, dynamic>;
          final DeviceEntityBase entity;

          entity = DeviceEntityDtoBase.fromJson(jsonData).toDomain();

          final VendorConnectorConjectureService? connector =
              VendorsConnectorConjecture().getVendorConnectorConjecture(
            entity.cbjDeviceVendor.vendorsAndServices,
          );
          if (connector == null) {
            return;
          }

          if (entity.entityStateGRPC.state ==
              EntityStateGRPC.addNewEntityFromJavascriptHub) {
            connector.foundEntity(entity);
          }
        } catch (e) {
          logger.e('Error $e');
          return;
        }
      },
      onError: (error) {
        print('Error: $error');
      },
      onDone: () {
        print('Connection closed');
      },
    );
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
