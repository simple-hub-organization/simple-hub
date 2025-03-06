import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_smart_device/application/usecases/button_object_u/button_with_light_object.dart';
import 'package:cbj_smart_device/application/usecases/button_object_u/simple_button_object.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/simple_devices/boiler_object.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/simple_devices/light_object.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/static_devices/blinds_object.dart';
import 'package:cbj_smart_device/utils.dart';

// enum DeviceType {
//   Light, //  Light ON/OFF
//   DynamicLight, //  Light with brightness 0% to 100%
//   Blinds,
//   Boiler,
//   Fan,
//   AirConditioner,
//   Camera,
//   Fridge,
//   Toaster,
//   CoffeeMachine,
//   SmartTV,
//   RCAirplane,
//   RCCar,
//   Speakers,
//
//   ///  Cleaning robot
//   Areaba,
//
//   ///  Give water to plants
//   Irrigation,
//   SmartBed,
//   AnimalTracker,
//   SmartCar,
// }

// ///  List of all the wishes that can be made
// enum WishEnum {
//   SOn, //  Turn the device on
//   SOff, //  Turn the device off
//   SChangeState, //  Change device state to the opposite one
//   SDynamic, //  Set Dynamic Value
//   ODynamic, //  Open connection to change dynamic value
//   SMovement, //  Open connection to change dynamic value
//   GState, //  Get device state on/off
//   SBlindsUp, //  Turn the blinds up
//   SBlindsDown, //  Turn the blinds Down
//   SBlindsStop, //  Stop the blinds
//   SBoilerOn, // Turn on the boiler
//   SBoilerOff, // Turn off the boiler
// }

// /// List of all the sources
// enum WishSourceEnum {
//   ServerRequest,
//   FireBase,
//   ButtonPress,
//   VoiceAssistant,
//   ScheduleRequests,
// }

///  List of all physical devices types
enum PhysicalDeviceType {
  nanoPiDuo2,
  nanoPiAir,
  nanoPiNeo,
  nanoPiNeo2,
  raspberryPi,
  notSupported,
}

enum RaspberryPiType {
  raspberryPi3ModelBRev1Underscore2,
  raspberryPi4ModelBRev1Underscore4,
}

class EnumHelper {
  ///  Convert deviceType to string
  static String deviceTypeToString(CbjDeviceTypes deviceType) {
    return deviceType.toString().replaceAll('CbjDeviceTypes.', '');
  }

  static CbjDeviceTypes? stringToDeviceType(String cbjDeviceTypestring) {
    for (final CbjDeviceTypes deviceType in CbjDeviceTypes.values) {
      if (deviceTypeToString(deviceType) == cbjDeviceTypestring) {
        return deviceType;
      }
    }
    return null;
  }

  ///  Convert Raspberry Pi type to string
  static String raspberryPiTypeToString(RaspberryPiType raspberryPiType) {
    return raspberryPiType.toString().replaceAll('RaspberryPiType.', '');
  }

  static RaspberryPiType? stringToRaspberryPiType(
    String raspberryPiTypeString,
  ) {
    for (final RaspberryPiType raspberryPiType in RaspberryPiType.values) {
      if (raspberryPiTypeToString(raspberryPiType) == raspberryPiTypeString) {
        return raspberryPiType;
      }
    }
    return null;
  }

  ///  Convert deviceAction to string
  static String deviceActionToString(CbjDeviceActions actionEnum) {
    return actionEnum.toString().replaceAll('CbjDeviceActions.', '');
  }

  ///  Convert string to deviceAction
  static CbjDeviceActions? stringToCbjDeviceActions(
    String cbjDeviceActionstring,
  ) {
    for (final CbjDeviceActions deviceAction in CbjDeviceActions.values) {
      if (deviceActionToString(deviceAction) == cbjDeviceActionstring) {
        return deviceAction;
      }
    }
    return null;
  }

  ///  Convert physicalDeviceType to string
  static String physicalDeviceTypeToString(PhysicalDeviceType? deviceType) {
    return deviceType.toString().replaceAll('PhysicalDeviceType.', '');
  }

  /// Return the corresponding SmartDeviceBaseAbstract Object of the deviceType
  static dynamic deviceTypeToSmartDeviceBaseAbstractObject(
    CbjDeviceTypes deviceType,
  ) {
    switch (deviceType) {
      case CbjDeviceTypes.light:
        return LightObject(null, null, null);
      case CbjDeviceTypes.blinds:
        return BlindsObject(null, null, null, null);
      case CbjDeviceTypes.boiler:
        return BoilerObject(null, null);
      case CbjDeviceTypes.button:
        return ButtonObject(null, null);
      case CbjDeviceTypes.buttonWithLight:
        return ButtonWithLightObject(
          null,
          null,
        );
      default:
        logger.i('Type $deviceType is not supported');
    }
    return null;
  }

  /// Returning the non abstract of this SmartDeviceBaseAbstract
  static Type getTheNonAbstractObjectOfSmartDeviceBaseAbstract(
    SmartDeviceBaseAbstract smartDeviceBaseAbstract,
    CbjDeviceTypes deviceType,
  ) {
    switch (deviceType) {
      case CbjDeviceTypes.light:
        return LightObject;
      case CbjDeviceTypes.blinds:
        return BlindsObject;
      case CbjDeviceTypes.boiler:
        return BoilerObject;
      default:
        throw Exception('$deviceType Conditioner was not implemented yet');
    }
  }
}
