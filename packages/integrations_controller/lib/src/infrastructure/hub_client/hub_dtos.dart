import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:integrations_controller/src/domain/hub/hub_entity.dart';
import 'package:integrations_controller/src/domain/hub/hub_value_objects.dart';

part 'hub_dtos.freezed.dart';
part 'hub_dtos.g.dart';

@freezed
abstract class HubDtos implements _$HubDtos {
  factory HubDtos({
    // @JsonKey(includeFromJson: true)

    required String hubNetworkBssid,
    required String networkName,
    required String lastKnownIp,
    // required ServerTimestampConverter() FieldValue serverTimeStamp,
  }) = _HubDtos;

  HubDtos._();

  factory HubDtos.fromDomain(HubEntity hubDE) {
    return HubDtos(
      hubNetworkBssid: hubDE.hubNetworkBssid.getOrCrash(),
      networkName: hubDE.networkName.getOrCrash(),
      lastKnownIp: hubDE.lastKnownIp.getOrCrash(),
    );
  }

  factory HubDtos.fromJson(Map<String, dynamic> json) =>
      _$HubDtosFromJson(json);

  final String deviceDtoClassInstance = (HubDtos).toString();

  HubEntity toDomain() {
    return HubEntity(
      hubNetworkBssid: HubNetworkBssid(hubNetworkBssid),
      networkName: HubNetworkName(networkName),
      lastKnownIp: HubNetworkIp(lastKnownIp),
    );
  }
}

// class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
//   const ServerTimestampConverter();
//
//   @override
//   FieldValue fromJson(Object json) {
//     return FieldValue.serverTimestamp();
//   }
//
//   @override
//   Object toJson(FieldValue fieldValue) => fieldValue;
// }
