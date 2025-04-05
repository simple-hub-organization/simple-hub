import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_blinds_entity/generic_blinds_device_dtos.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_boiler_entity/generic_boiler_device_dtos.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_dimmable_light_entity/generic_dimmable_light_device_dtos.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_empty_entity/generic_empty_device_dtos.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_light_entity/generic_light_device_dtos.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_ping_entity/generic_ping_device_dtos.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_printer_entity/generic_printer_device_dtos.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_device_dtos.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_smart_computer_entity/generic_smart_computer_device_dtos.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_smart_plug_entity/generic_smart_plug_device_dtos.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_smart_tv_entity/generic_smart_tv_device_dtos.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_smart_type_type_not_supported_entity/generic_smart_type_not_supported_device_dtos.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_switch_entity/generic_switch_device_dtos.dart';
import 'package:integrations_controller/src/infrastructure/core/utils.dart';

class DeviceEntityDtoBase {
  DeviceEntityDtoBase();

  factory DeviceEntityDtoBase.fromDomain() {
    icLogger.t('DeviceEntityDtoAbstract.fromDomain');
    return DeviceEntityDtoBase();
  }

  factory DeviceEntityDtoBase.fromJson(Map<String, dynamic> json) {
    DeviceEntityDtoBase deviceEntityDtoAbstract = DeviceEntityDtoBase();
    final String jsonDeviceDtoClass = json['deviceDtoClass'].toString();
    final EntityTypes type =
        EntityTypesExtension.fromString(json['entityTypes'] as String);

    if (jsonDeviceDtoClass == (GenericLightDeviceDtos).toString() ||
        type == EntityTypes.light) {
      deviceEntityDtoAbstract = GenericLightDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass ==
            (GenericDimmableLightDeviceDtos).toString() ||
        type == EntityTypes.dimmableLight) {
      deviceEntityDtoAbstract = GenericDimmableLightDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass == (GenericRgbwLightDeviceDtos).toString() ||
        type == EntityTypes.rgbwLights) {
      deviceEntityDtoAbstract = GenericRgbwLightDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass == (GenericBlindsDeviceDtos).toString() ||
        type == EntityTypes.blinds) {
      deviceEntityDtoAbstract = GenericBlindsDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass == (GenericBoilerDeviceDtos).toString() ||
        type == EntityTypes.boiler) {
      deviceEntityDtoAbstract = GenericBoilerDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass == (GenericSmartTvDeviceDtos).toString() ||
        type == EntityTypes.smartTV) {
      deviceEntityDtoAbstract = GenericSmartTvDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass == (GenericSwitchDeviceDtos).toString() ||
        type == EntityTypes.switch_) {
      deviceEntityDtoAbstract = GenericSwitchDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass == (GenericSmartPlugDeviceDtos).toString() ||
        type == EntityTypes.smartPlug) {
      deviceEntityDtoAbstract = GenericSmartPlugDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass ==
            (GenericSmartComputerDeviceDtos).toString() ||
        type == EntityTypes.smartComputer) {
      deviceEntityDtoAbstract = GenericSmartComputerDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass == (GenericPrinterDeviceDtos).toString() ||
        type == EntityTypes.printer) {
      deviceEntityDtoAbstract = GenericPrinterDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass ==
            (GenericUnsupportedDeviceDtos).toString() ||
        type == EntityTypes.emptyEntity) {
      deviceEntityDtoAbstract = GenericUnsupportedDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass == (GenericPingDeviceDtos).toString() ||
        type == EntityTypes.pingEntity) {
      deviceEntityDtoAbstract = GenericPingDeviceDtos.fromJson(json);
    } else if (jsonDeviceDtoClass ==
            (GenericSmartTypeNotSupportedDeviceDtos).toString() ||
        type == EntityTypes.undefined) {
      deviceEntityDtoAbstract =
          GenericSmartTypeNotSupportedDeviceDtos.fromJson(json);
    } else {
      throw 'DtoClassTypeDoesNotExist, please add here support for ${json['entityTypes']}';
    }
    return deviceEntityDtoAbstract;
  }

  final String deviceDtoClassInstance = (DeviceEntityDtoBase).toString();

  Map<String, dynamic> toJson() {
    icLogger.t('DeviceEntityDtoAbstract to Json');
    return {};
  }

  DeviceEntityBase toDomain() {
    icLogger.t('ToDomain');
    return DeviceEntityNotAbstract();
  }
}
