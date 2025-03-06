import 'dart:convert';

class NetworkObject {
  NetworkObject({
    required this.ssid,
    required this.bssid,
    required this.subNet,
    required this.longitude,
    required this.latitude,
    required this.type,
    required this.remotePipe,
    String? uniqueId,
  }) {
    this.uniqueId = uniqueId ?? bssid ?? 'home';
  }

  factory NetworkObject.fromJson(Map<String, dynamic> json) {
    return NetworkObject(
      uniqueId: json['uniqueId'] as String,
      ssid: json['ssid'] as String?,
      bssid: json['bssid'] as String?,
      subNet: json['subNet'] as String?,
      longitude: json['longitude'] as double?,
      latitude: json['latitude'] as double?,
      type: json['type'] as String?,
      remotePipe: json['remotePipe'] as String?,
    );
  }

  factory NetworkObject.fromJsonString(String value) => NetworkObject.fromJson(
        jsonDecode(value) as Map<String, dynamic>,
      );

  late String uniqueId;

  /// Network name
  String? ssid;

  /// Unique identifier
  String? bssid;
  String? subNet;
  double? longitude;
  double? latitude;

  /// IPv4 or IPv6
  String? type;
  String? remotePipe;

  Map<String, dynamic> toJson() => {
        'uniqueId': uniqueId,
        'ssid': ssid,
        'bssid': bssid,
        'subNet': subNet,
        'longitude': longitude,
        'latitude': latitude,
        'type': type,
        'remotePipe': remotePipe,
      };

  String toJsonString() => jsonEncode(toJson());
}
