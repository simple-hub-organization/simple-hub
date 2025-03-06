import 'dart:collection';

import 'package:integrations_controller/src/domain/core/request_action_types.dart';

enum EntityProperties {
  undefined,
  blindsSwitchState,
  boilerSwitchState,
  lightSwitchState,
  lightColorTemperature,
  lightColorHsvColor,
  lightBrightness,
  pingSwitchState,
  printerSwitchState,
  securityCameraSuspendState,
  securityCameraShutDownState,
  smartComputerSuspendState,
  smartComputerShutDownState,
  smartPlugState,
  smartTvSwitchState,
  openUrl,
  skip,
  volume,
  switchState,
  speakers,
  color,
  acSwitchState,
  delay,
  ;

  bool containsAction(EntityActions action) {
    return getActions.contains(action);
  }

  HashSet<EntityActions> get getActions =>
      propertiesActions[index] ?? HashSet();

  static HashMap<int, HashSet<EntityActions>> propertiesActions =
      HashMap<int, HashSet<EntityActions>>.fromEntries([
    MapEntry(
      EntityProperties.blindsSwitchState.index,
      HashSet.from([
        EntityActions.moveUp,
        EntityActions.stop,
        EntityActions.moveDown,
      ]),
    ),
    MapEntry(
      EntityProperties.switchState.index,
      HashSet.from([EntityActions.on, EntityActions.off]),
    ),
    MapEntry(
      EntityProperties.boilerSwitchState.index,
      HashSet.from([EntityActions.on, EntityActions.off]),
    ),
    MapEntry(
      EntityProperties.lightSwitchState.index,
      HashSet.from([EntityActions.on, EntityActions.off]),
    ),
    MapEntry(
      EntityProperties.pingSwitchState.index,
      HashSet.from([EntityActions.on, EntityActions.off]),
    ),
    MapEntry(
      EntityProperties.printerSwitchState.index,
      HashSet.from([EntityActions.on, EntityActions.off]),
    ),
    MapEntry(
      EntityProperties.smartPlugState.index,
      HashSet.from([EntityActions.on, EntityActions.off]),
    ),
    MapEntry(
      EntityProperties.smartTvSwitchState.index,
      HashSet.from([
        EntityActions.on,
        EntityActions.off,
        EntityActions.play,
        EntityActions.pause,
        EntityActions.close,
      ]),
    ),
    MapEntry(
      EntityProperties.lightColorTemperature.index,
      HashSet.from([EntityActions.changeTemperature]),
    ),
    MapEntry(
      EntityProperties.lightColorHsvColor.index,
      HashSet.from([EntityActions.hsvColor]),
    ),
    MapEntry(
      EntityProperties.lightBrightness.index,
      HashSet.from([EntityActions.changeTemperature]),
    ),
    MapEntry(
      EntityProperties.securityCameraSuspendState.index,
      HashSet.from([EntityActions.suspend]),
    ),
    MapEntry(
      EntityProperties.securityCameraShutDownState.index,
      HashSet.from([EntityActions.shutdown]),
    ),
    MapEntry(
      EntityProperties.smartComputerSuspendState.index,
      HashSet.from([EntityActions.suspend]),
    ),
    MapEntry(
      EntityProperties.smartComputerShutDownState.index,
      HashSet.from([EntityActions.shutdown]),
    ),
    MapEntry(
      EntityProperties.openUrl.index,
      HashSet.from([EntityActions.open]),
    ),
    MapEntry(
      EntityProperties.skip.index,
      HashSet.from([EntityActions.skip]),
    ),
    MapEntry(
      EntityProperties.volume.index,
      HashSet.from([EntityActions.volumeDown]),
    ),
    MapEntry(
      EntityProperties.openUrl.index,
      HashSet.from([EntityActions.open]),
    ),
  ]);
}

extension EntityPropertiesExtension on EntityProperties {
  static EntityProperties fromString(String typeAsString) {
    return EntityProperties.values.firstWhere(
      (element) => element.toString().split('.').last == typeAsString,
      orElse: () => EntityProperties.undefined,
    );
  }
}

// TODO: Check again logic, (deviceType.toString().replaceAll('EntityState.', '');) probably does not work correctly

class EntityUtils {
  static String dTToString(EntityTypes deviceType) {
    return deviceType.toString().replaceAll('EntityState.', '');
  }

  static String deviceVendorToString(VendorsAndServices vendorsAndServices) {
    return vendorsAndServices.toString().replaceAll('VendorsAndServices.', '');
  }

  static EntityTypes? stringToDt(String? deviceTypeAsString) {
    if (deviceTypeAsString == null) {
      return null;
    }
    String deviceTypeAsStringTemp = deviceTypeAsString;
    if (deviceTypeAsStringTemp.contains('Object')) {
      deviceTypeAsStringTemp = deviceTypeAsStringTemp.substring(
        0,
        deviceTypeAsStringTemp.indexOf('Object'),
      );
    }
    for (final EntityTypes deviceType in EntityTypes.values) {
      if (dTToString(deviceType) == deviceTypeAsStringTemp) {
        return deviceType;
      }
    }
    return null;
  }

  static VendorsAndServices stringToDeviceVendor(String deviceVendorAsString) {
    String deviceTypeAsStringTemp = deviceVendorAsString;
    if (deviceTypeAsStringTemp.contains('Object')) {
      deviceTypeAsStringTemp = deviceTypeAsStringTemp.substring(
        0,
        deviceTypeAsStringTemp.indexOf('Object'),
      );
    }
    for (final VendorsAndServices deviceType in VendorsAndServices.values) {
      if (deviceVendorToString(deviceType) == deviceTypeAsStringTemp) {
        return deviceType;
      }
    }
    return VendorsAndServices.undefined;
  }

  ///  Convert deviceAction to string
  static String deviceActionToString(EntityActions deviceAction) {
    return deviceAction.toString().replaceAll('EntityActions.', '');
  }

  ///  Convert string to deviceAction
  static EntityActions? stringToDeviceAction(String deviceActionString) {
    for (final EntityActions deviceAction in EntityActions.values) {
      if (deviceActionToString(deviceAction) == deviceActionString) {
        return deviceAction;
      }
    }
    return null;
  }

  ///  Convert deviceState to string
  static String deviceStateToString(EntityStateGRPC deviceState) {
    return deviceState.toString().replaceAll('EntityStateGRPC.', '');
  }

  ///  Convert string to deviceState
  static EntityStateGRPC? stringToDeviceState(String deviceStateAsString) {
    for (final EntityStateGRPC deviceState in EntityStateGRPC.values) {
      if (deviceStateToString(deviceState) == deviceStateAsString) {
        return deviceState;
      }
    }
    return null;
  }

  /// Return the corresponding SmartDeviceBaseAbstract Object of the deviceType
  static dynamic deviceTypeToSmartDeviceBaseAbstractObject(
    EntityTypes deviceType,
  ) {
    throw Exception('$deviceType Conditioner was not implemented yet');
  }

  /// Returning the non abstract of this SmartDeviceBaseAbstract
  static Type getTheNonAbstractObjectOfSmartDeviceBaseAbstract(
    dynamic smartDeviceBaseAbstract,
    EntityTypes deviceType,
  ) {
    throw Exception('$deviceType Conditioner was not implemented yet');
  }
}
