import 'package:cybearjinni/domain/software_info/software_info_entity.dart';
import 'package:cybearjinni/domain/software_info/software_info_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'software_info_dtos.freezed.dart';
part 'software_info_dtos.g.dart';

@freezed
abstract class SoftwareInfoDtos implements _$SoftwareInfoDtos {
  factory SoftwareInfoDtos({
    // @JsonKey(includeFromJson: true)
    required String deviceName,
    required String pubspecYamlVersion,
    required String protoLastGenDate,
    required String dartSdkVersion,
    required String compId,
    required String compUuid,
    required String compOs,
    required String compModel,
    required String compType,
    required String compIp,
    // required ServerTimestampConverter() FieldValue serverTimeStamp,
  }) = _SoftwareInfoDtos;

  SoftwareInfoDtos._();

  factory SoftwareInfoDtos.fromDomain(SoftwareInfoEntity softwareInfoEntity) {
    return SoftwareInfoDtos(
      deviceName: softwareInfoEntity.deviceName.getOrCrash(),
      pubspecYamlVersion: softwareInfoEntity.pubspecYamlVersion.getOrCrash(),
      protoLastGenDate: softwareInfoEntity.protoLastGenDate.getOrCrash(),
      dartSdkVersion: softwareInfoEntity.dartSdkVersion.getOrCrash(),
      compId: softwareInfoEntity.compId.getOrCrash(),
      compUuid: softwareInfoEntity.compUuid.getOrCrash(),
      compOs: softwareInfoEntity.compOs.getOrCrash(),
      compModel: softwareInfoEntity.compModel.getOrCrash(),
      compType: softwareInfoEntity.compType.getOrCrash(),
      compIp: softwareInfoEntity.compIp.getOrCrash(),
    );
  }

  factory SoftwareInfoDtos.fromJson(Map<String, dynamic> json) =>
      _$SoftwareInfoDtosFromJson(json);

  final String deviceDtoClassInstance = (SoftwareInfoDtos).toString();

  SoftwareInfoEntity toDomain() {
    return SoftwareInfoEntity(
      deviceName: SoftwareInfoDeviceName(deviceName),
      pubspecYamlVersion: SoftwareInfoPubspecYamlVersion(pubspecYamlVersion),
      protoLastGenDate: SoftwareInfoProtoLastGenDate(protoLastGenDate),
      dartSdkVersion: SoftwareInfoDartSdkVersion(dartSdkVersion),
      compId: SoftwareInfoCompId(compId),
      compUuid: SoftwareInfoCompUuid(compUuid),
      compOs: SoftwareInfoCompOs(compOs),
      compModel: SoftwareInfoCompModel(compModel),
      compType: SoftwareInfoCompType(deviceName),
      compIp: SoftwareInfoCompIp(compType),
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
