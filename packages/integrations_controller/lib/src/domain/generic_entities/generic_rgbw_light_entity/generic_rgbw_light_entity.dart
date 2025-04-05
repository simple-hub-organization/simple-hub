import 'package:dartz/dartz.dart';
import 'package:integrations_controller/src/domain/core/request_action_types.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/core_failures.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/device_entity_dto_base.dart';
import 'package:integrations_controller/src/domain/generic_entities/abstract_entity/value_objects_core.dart';
import 'package:integrations_controller/src/domain/generic_entities/entity_type_utils.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_device_dtos.dart';
import 'package:integrations_controller/src/domain/generic_entities/generic_rgbw_light_entity/generic_rgbw_light_value_objects.dart';

/// Abstract smart GenericLight that exist inside a computer, the
/// implementations will be actual GenericLight like blinds lights and more
class GenericRgbwLightDE extends DeviceEntityBase {
  /// All public field of GenericLight entity
  GenericRgbwLightDE({
    required super.uniqueId,
    required super.entityUniqueId,
    required super.cbjDeviceVendor,
    required super.deviceVendor,
    required super.deviceNetworkLastUpdate,
    required super.cbjEntityName,
    required super.entityOriginalName,
    required super.deviceOriginalName,
    required super.stateMassage,
    required super.senderDeviceOs,
    required super.senderDeviceModel,
    required super.senderId,
    required super.compUuid,
    required super.entityStateGRPC,
    required super.powerConsumption,
    required super.deviceUniqueId,
    required super.devicePort,
    required super.deviceLastKnownIp,
    required super.deviceHostName,
    required super.deviceMdns,
    required super.srvResourceRecord,
    required super.srvTarget,
    required super.ptrResourceRecord,
    required super.mdnsServiceType,
    required super.devicesMacAddress,
    required super.entityKey,
    required super.requestTimeStamp,
    required super.lastResponseFromDeviceTimeStamp,
    required super.entityCbjUniqueId,
    required this.lightSwitchState,
    required this.lightColorTemperature,
    required this.lightColorAlpha,
    required this.lightColorHue,
    required this.lightColorSaturation,
    required this.lightColorValue,
    required this.lightBrightness,
    required this.colorMode,
  }) : super(
          entityTypes: EntityType.type(EntityTypes.rgbwLights),
        );

  /// Empty instance of GenericLightEntity
  factory GenericRgbwLightDE.empty() => GenericRgbwLightDE(
        uniqueId: CoreUniqueId(),
        entityUniqueId: EntityUniqueId(''),
        cbjEntityName: CbjEntityName(value: ''),
        entityOriginalName: EntityOriginalName(''),
        deviceOriginalName: DeviceOriginalName(value: ''),
        entityStateGRPC: EntityState.state(EntityStateGRPC.undefined),
        senderDeviceOs: DeviceSenderDeviceOs(''),
        senderDeviceModel: DeviceSenderDeviceModel(''),
        stateMassage: DeviceStateMassage(value: ''),
        senderId: DeviceSenderId(),
        cbjDeviceVendor: CbjDeviceVendor(VendorsAndServices.undefined),
        deviceVendor: DeviceVendor(),
        deviceNetworkLastUpdate: DeviceNetworkLastUpdate(),
        deviceUniqueId: DeviceUniqueId(''),
        devicePort: DevicePort(value: ''),
        deviceLastKnownIp: DeviceLastKnownIp(value: ''),
        deviceHostName: DeviceHostName(value: ''),
        deviceMdns: DeviceMdns(value: ''),
        srvResourceRecord: DeviceSrvResourceRecord(),
        mdnsServiceType: DeviceMdnsServiceType(),
        ptrResourceRecord: DevicePtrResourceRecord(),
        srvTarget: DeviceSrvTarget(),
        compUuid: DeviceCompUuid(''),
        powerConsumption: DevicePowerConsumption(''),
        devicesMacAddress: DevicesMacAddress(value: ''),
        entityKey: EntityKey(''),
        requestTimeStamp: RequestTimeStamp(''),
        lastResponseFromDeviceTimeStamp: LastResponseFromDeviceTimeStamp(''),
        entityCbjUniqueId: CoreUniqueId(),
        lightSwitchState:
            GenericRgbwLightSwitchState(EntityActions.off.toString()),
        lightColorTemperature: GenericRgbwLightColorTemperature(''),
        lightBrightness: GenericRgbwLightBrightness(''),
        lightColorAlpha: GenericRgbwLightColorAlpha(''),
        lightColorHue: GenericRgbwLightColorHue(''),
        lightColorSaturation: GenericRgbwLightColorSaturation(''),
        lightColorValue: GenericRgbwLightColorValue(''),
        colorMode: GenericLightModeState(ColorMode.undefined),
      );

  GenericLightModeState colorMode;

  /// State of the light on/off
  GenericRgbwLightSwitchState lightSwitchState;

  /// Color temperature in int
  GenericRgbwLightColorTemperature lightColorTemperature;

  /// Color alpha in double
  GenericRgbwLightColorAlpha lightColorAlpha;

  /// Color hue in double
  GenericRgbwLightColorHue lightColorHue;

  /// Color saturation in double
  GenericRgbwLightColorSaturation lightColorSaturation;

  /// Color value in double
  GenericRgbwLightColorValue lightColorValue;

  /// Brightness 0-100%
  GenericRgbwLightBrightness lightBrightness;

  int sendNewTemperatureColorEachMilliseconds = 200;
  bool doesWaitingToSendTemperatureColorRequest = false;

  int sendNewHsvColorEachMilliseconds = 200;
  bool doesWaitingToSendHsvColorRequest = false;

  int sendNewBrightnessEachMilliseconds = 200;
  bool doesWaitingToSendBrightnessRequest = false;

  Option<CoreFailure<dynamic>> get failureOption =>
      cbjEntityName.value.fold((f) => some(f), (_) => none());

  /// Return a list of all valid actions for this device
  @override
  List<String> getAllValidActions() {
    return GenericRgbwLightSwitchState.rgbwLightValidActions();
  }

  @override
  DeviceEntityDtoBase toInfrastructure() {
    return GenericRgbwLightDeviceDtos(
      deviceDtoClass: (GenericRgbwLightDeviceDtos).toString(),
      id: uniqueId.getOrCrash(),
      entityUniqueId: entityUniqueId.getOrCrash(),
      cbjEntityName: cbjEntityName.getOrCrash(),
      entityOriginalName: entityOriginalName.getOrCrash(),
      deviceOriginalName: deviceOriginalName.getOrCrash(),
      entityStateGRPC: entityStateGRPC.getOrCrash(),
      stateMassage: stateMassage.getOrCrash(),
      senderDeviceOs: senderDeviceOs.getOrCrash(),
      senderDeviceModel: senderDeviceModel.getOrCrash(),
      senderId: senderId.getOrCrash(),
      entityTypes: entityTypes.getOrCrash(),
      compUuid: compUuid.getOrCrash(),
      cbjDeviceVendor: cbjDeviceVendor.getOrCrash(),
      deviceVendor: deviceVendor.getOrCrash(),
      deviceNetworkLastUpdate: deviceNetworkLastUpdate.getOrCrash(),
      powerConsumption: powerConsumption.getOrCrash(),
      deviceUniqueId: deviceUniqueId.getOrCrash(),
      devicePort: devicePort.getOrCrash(),
      deviceLastKnownIp: deviceLastKnownIp.getOrCrash(),
      deviceHostName: deviceHostName.getOrCrash(),
      deviceMdns: deviceMdns.getOrCrash(),
      devicesMacAddress: devicesMacAddress.getOrCrash(),
      srvResourceRecord: srvResourceRecord.getOrCrash(),
      srvTarget: srvTarget.getOrCrash(),
      ptrResourceRecord: ptrResourceRecord.getOrCrash(),
      mdnsServiceType: mdnsServiceType.getOrCrash(),
      entityKey: entityKey.getOrCrash(),
      requestTimeStamp: requestTimeStamp.getOrCrash(),
      lastResponseFromDeviceTimeStamp:
          lastResponseFromDeviceTimeStamp.getOrCrash(),
      entityCbjUniqueId: entityCbjUniqueId.getOrCrash(),
      lightSwitchState: lightSwitchState.getOrCrash(),
      lightColorTemperature: lightColorTemperature.getOrCrash(),
      lightBrightness: lightBrightness.getOrCrash(),
      lightColorAlpha: lightColorAlpha.getOrCrash(),
      lightColorHue: lightColorHue.getOrCrash(),
      lightColorSaturation: lightColorSaturation.getOrCrash(),
      lightColorValue: lightColorValue.getOrCrash(),
      lightMode: colorMode.getOrCrash(),
    );
  }

  @override
  Future<Either<CoreFailure<dynamic>, Unit>> executeAction(
    EntitySingleRequest request,
  ) async {
    if (!canActivateAction(request)) {
      return left(const CoreFailure.unexpected());
    }

    if (request.property == EntityProperties.lightBrightness &&
        request.values != null &&
        request.values![ActionValues.brightness] != null) {
      final dynamic brightness = request.values![ActionValues.brightness];
      if (brightness is! int) {
        return const Left(CoreFailure.unexpected());
      }
      return setBrightness(brightness);
    }

    switch (request.action) {
      case EntityActions.on:
        return turnOnLight();
      case EntityActions.off:
        return turnOffLight();
      case EntityActions.changeTemperature:
        final dynamic value = request.values?[ActionValues.colorTemperature];
        if (value is! int) {
          return const Left(CoreFailure.unexpected());
        }
        return changeColorTemperature(value);
      case EntityActions.hsvColor:
        final dynamic alpha = request.values?[ActionValues.alpha];
        final dynamic hue = request.values?[ActionValues.hue];
        final dynamic saturation = request.values?[ActionValues.saturation];
        final dynamic value = request.values?[ActionValues.colorValue];
        final dynamic transitionDuration =
            request.values?[ActionValues.transitionDuration];
        if (alpha is! double ||
            hue is! double ||
            saturation is! double ||
            value is! double ||
            transitionDuration is! Duration?) {
          return const Left(CoreFailure.unexpected());
        }
        return changeColorHsv(
          alpha: alpha,
          hue: hue,
          saturation: saturation,
          value: value,
          transitionDuration: transitionDuration,
        );
      default:
        break;
    }

    return super.executeAction(request);
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> turnOnLight() async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> turnOffLight() async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> setBrightness(int value) async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> changeColorTemperature(
    int temperature,
  ) async =>
      pleaseOverrideMessage();

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> changeColorHsv({
    /// 0° to 360°,  120° is green, and 240° is blue
    required double hue,

    /// 0.0 to 1.0 (not 0% to 100%)
    required double value,

    /// Ours is 0.0 to 1.0 (not 0% to 100%)
    required double saturation,

    /// 0.0 to 1.0 (not 0% to 100% or 0 to 255)
    required double alpha,

    /// From old color to the new one
    Duration? transitionDuration,
  }) async =>
      pleaseOverrideMessage();

  @override
  bool replaceActionIfExist(String action) {
    if (GenericRgbwLightSwitchState.rgbwLightValidActions().contains(action)) {
      lightSwitchState = GenericRgbwLightSwitchState(action);
      return true;
    }
    return false;
  }

  @override
  List<EntityProperties> getListOfPropertiesToChange() {
    return [
      EntityProperties.lightSwitchState,
      EntityProperties.lightColorTemperature,
      // EntityProperties.lightColorAlpha,
      // EntityProperties.lightColorHue,
      // EntityProperties.lightColorSaturation,
      // EntityProperties.lightColorValue,
      EntityProperties.lightBrightness,
    ];
  }
}
