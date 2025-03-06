import 'dart:convert';

import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:cbj_integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_dto_base.dart';

class DeviceHelper {
  /// Dto to json
  static Map<String, dynamic> convertDtoToJson(
    DeviceEntityDtoBase deviceEntityDto,
  ) =>
      deviceEntityDto.toJson();

  /// json to Dto
  static DeviceEntityDtoBase convertJsonToDto(Map<String, dynamic> json) =>
      DeviceEntityDtoBase.fromJson(json);

  /// json to json string
  static String convertJsonToJsonString(Map<String, dynamic> json) =>
      jsonEncode(json);

  /// string json to json
  static Map<String, dynamic> convertJsonStringToJson(String jsonString) =>
      jsonDecode(jsonString) as Map<String, dynamic>;

  /// Device entity to dto
  static DeviceEntityDtoBase convertDomainToDto(
    DeviceEntityBase deviceEntity,
  ) =>
      deviceEntity.toInfrastructure();

  /// Dto to device entity
  static DeviceEntityBase convertDtoToDomain(
    DeviceEntityDtoBase deviceEntityDto,
  ) =>
      deviceEntityDto.toDomain();

  // Extras methods

  static DeviceEntityDtoBase convertJsonStringToDto(String jsonString) =>
      convertJsonToDto(convertJsonStringToJson(jsonString));

  static String convertDtoToJsonString(
    DeviceEntityDtoBase deviceEntityDto,
  ) =>
      convertJsonToJsonString(convertDtoToJson(deviceEntityDto));

  static DeviceEntityBase convertJsonStringToDomain(String jsonString) =>
      convertDtoToDomain(convertJsonStringToDto(jsonString));

  static String convertDomainToJsonString(DeviceEntityBase deviceEntity) =>
      convertJsonToJsonString(
        convertDtoToJson(convertDomainToDto(deviceEntity)),
      );
}
