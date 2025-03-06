import 'package:integrations_controller/src/domain/core/request_action_types.dart';

/// Moving here values that need to be sheard with the app as well as the vendor connector conjecture.
class VendorEntityInformation {
  /// Create object from JSON
  factory VendorEntityInformation.fromJson(Map<String, dynamic> json) {
    return VendorEntityInformation(
      VendorsAndServices.values.byName(json['vendorsAndServices'] as String),
      displayName: json['displayName'] as String,
      imageUrl: json['imageUrl'] as String,
      urlToLoginCredentials: json['urlToLoginCredentials'] as String?,
      loginType: VendorLoginTypes.values.byName(json['loginType'] as String),
    );
  }
  VendorEntityInformation(
    this.vendorsAndServices, {
    required this.displayName,
    required this.imageUrl,
    required this.loginType,
    this.urlToLoginCredentials,
  });

  final VendorsAndServices vendorsAndServices;
  final String displayName;
  final String imageUrl;
  final String? urlToLoginCredentials;
  final VendorLoginTypes loginType;

  /// Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'vendorsAndServices': vendorsAndServices.name,
      'displayName': displayName,
      'imageUrl': imageUrl,
      'urlToLoginCredentials': urlToLoginCredentials,
      'loginType': loginType.name,
    };
  }
}
