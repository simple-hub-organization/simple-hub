import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/infrastructure/vendor_login/vendor_login_entity_dtos.dart';

class VendorLoginEntity {
  VendorLoginEntity(
    this.vendor, {
    this.apiKey,
    this.authToken,
    this.pairingCode,
    this.email,
    this.password,
    this.ip,
    this.port,
    this.deviceUniqueId,
  });

  VendorsAndServices vendor;
  final String? apiKey;
  final String? authToken;
  final String? pairingCode;
  final String? email;
  final String? password;
  final String? ip;
  final String? port;
  final String? deviceUniqueId;
  static String event = 'setUpDevice';

  VendorLoginEntityDtos toInfrastructure() {
    final Map<String, dynamic> credentials = {};

    if (apiKey != null) {
      credentials.addEntries([MapEntry('apiKey', apiKey)]);
    }
    if (authToken != null) {
      credentials.addEntries([MapEntry('authToken', authToken)]);
    }
    if (pairingCode != null) {
      credentials.addEntries([MapEntry('pairingCode', pairingCode)]);
    }
    if (email != null) {
      credentials.addEntries([MapEntry('email', email)]);
    }
    if (password != null) {
      credentials.addEntries([MapEntry('password', password)]);
    }
    if (ip != null) {
      credentials.addEntries([MapEntry('ip', ip)]);
    }
    if (port != null) {
      credentials.addEntries([MapEntry('port', port)]);
    }
    if (deviceUniqueId != null) {
      credentials.addEntries([MapEntry('deviceUniqueId', deviceUniqueId)]);
    }

    return VendorLoginEntityDtos(
      vendor: vendor.name,
      credentials: credentials,
    );
  }
}
