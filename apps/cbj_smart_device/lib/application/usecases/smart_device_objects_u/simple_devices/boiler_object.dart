import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_smart_device/application/usecases/button_object_u/button_object_local_u.dart';
import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_simple_abstract.dart';
import 'package:cbj_smart_device/application/usecases/wish_classes_u/off_wish_u.dart';
import 'package:cbj_smart_device/application/usecases/wish_classes_u/on_wish_u.dart';
import 'package:cbj_smart_device/utils.dart';

class BoilerObject extends SmartDeviceSimpleAbstract {
  BoilerObject(
    String? uuid,
    String? smartInstanceName,
    // int? boilerPinNUmber,
    // int? boilerButtonPinNumber,
    {
    int? onOffPinNumber,
    int? onOffButtonPinNumber,
  }) : super(
          uuid,
          smartInstanceName,
          onOffPinNumber,
          onOffButtonPinNumber: onOffButtonPinNumber,
        ) {
    logger.i('New boiler object');
    // boilerPin = DevicePinListManager().getGpioPin(boilerPinNUmber);
    // boilerButtonPin = DevicePinListManager().getGpioPin(boilerButtonPinNumber);
    listenButtonsPress();
    deviceType = CbjDeviceTypes.boiler;
  }

  PinInformation? boilerPin;
  PinInformation? boilerButtonPin;

  @override
  List<String> getNeededPinTypesList() => <String>['gpio', 'gpio'];

  static List<String> neededPinTypesList() => <String>['gpio', 'gpio'];

  ///  Return smart device type
  @override
  CbjDeviceTypes getDeviceType() => CbjDeviceTypes.boiler;

  @override
  Future<String> executeActionString(
    String wishString,
    CbjDeviceStateGRPC deviceState,
  ) async {
    final CbjDeviceActions deviceAction =
        convertWishStringToWishesObject(wishString)!;
    return executeDeviceAction(deviceAction, deviceState);
  }

  @override
  Future<String> executeDeviceAction(
    CbjDeviceActions deviceAction,
    CbjDeviceStateGRPC deviceState,
  ) async {
    return wishInBoilerClass(deviceAction, deviceState);
  }

  ///  All the wishes that are legit to execute from the blinds class
  Future<String> wishInBoilerClass(
    CbjDeviceActions? deviceAction,
    CbjDeviceStateGRPC deviceState,
  ) async {
    String? wishExecuteResult;

    if (deviceAction == null) {
      return 'Your wish does not exist in boiler class';
    }
    if (deviceAction == CbjDeviceActions.on) {
      wishExecuteResult = OnWishU.setOn(deviceInformation, boilerPin);
    }
    if (deviceAction == CbjDeviceActions.off) {
      wishExecuteResult = OffWishU.setOff(deviceInformation, boilerPin);
    }

    if (wishExecuteResult != null) {
      if (deviceState != CbjDeviceStateGRPC.ack) {}
      return wishExecuteResult;
    }

    return wishInSimpleClass(deviceAction, deviceState);
  }

  void listenButtonsPress() {
    if (boilerPin != null && boilerButtonPin != null) {
      ButtonObjectLocalU()
          .buttonPressedForBoiler(this, boilerButtonPin!, boilerPin!);
    } else {
      logger.i('Cannot listen to boiler, one of the variables is null');
    }
  }
}
