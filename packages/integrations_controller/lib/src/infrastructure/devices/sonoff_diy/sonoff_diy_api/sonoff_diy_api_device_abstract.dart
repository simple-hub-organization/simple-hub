import 'dart:convert';

import 'package:integrations_controller/src/infrastructure/core/utils.dart';
import 'package:http/http.dart' as http;

abstract class SonoffApiDeviceAbstract {
  SonoffApiDeviceAbstract({
    required this.ipAddress,
    required this.port,
    required this.hostName,
  }) {
    baseUrl = 'http://$ipAddress:$port';
  }

  String ipAddress;
  String hostName;
  int port;
  String serviceType = '_ewelink._tcp';
  String get serviceInstanceName => hostName;
  String get deviceId {
    final List<String> hostNameSplit = hostName.split('_');
    if (hostNameSplit.length >= 2) {
      return hostNameSplit[1];
    }
    return '';
  }

  late String baseUrl;

  Future<String> getInfo() async {
    final url = Uri.parse('$baseUrl/zeroconf/info');
    final body = '''
{
    "deviceid": "$deviceId",
    "data": {
        "switch": "on"
       }
}
        ''';

    final Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final http.Response response =
        await http.post(url, body: body, headers: headers);
    final String responseJson = json.decode(response.body).toString();
    icLogger.t(responseJson);

    return responseJson;
  }
}
