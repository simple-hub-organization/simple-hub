import 'dart:convert';

import 'package:integrations_controller/src/infrastructure/core/utils.dart';
import 'package:integrations_controller/src/infrastructure/devices/sonoff_diy/sonoff_diy_api/sonoff_diy_api_device_abstract.dart';
import 'package:http/http.dart' as http;

class SonoffDiyApiWallSwitch extends SonoffApiDeviceAbstract {
  SonoffDiyApiWallSwitch({
    required super.ipAddress,
    required super.port,
    required super.hostName,
  });

  Future<String> switchOn() async {
    final url = Uri.parse('$baseUrl/zeroconf/switch');
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

  Future<String> switchOff() async {
    final url = Uri.parse('$baseUrl/zeroconf/switch');
    final body = '''
{
    "deviceid": "$deviceId",
    "data": {
        "switch": "off"
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
