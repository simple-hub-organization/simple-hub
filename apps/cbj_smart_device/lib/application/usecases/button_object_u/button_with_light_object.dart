import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_smart_device/application/usecases/button_object_u/simple_button_object.dart';
import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:cbj_smart_device/application/usecases/wish_classes_u/off_wish_u.dart';
import 'package:cbj_smart_device/application/usecases/wish_classes_u/on_wish_u.dart';
import 'package:cbj_smart_device/infrastructure/repositories/button_object_r/button_object_r.dart';
import 'package:cbj_smart_device/utils.dart';

/// Button that contains light inside of it with one color and no opacity.
class ButtonWithLightObject extends ButtonObject {
  ButtonWithLightObject(
    super.id,
    super.deviceName,
    // super.buttonPinInt,
    // int? buttonLightInt,
    {
    super.buttonStatesAction,
  }) {
    // buttonLight = DevicePinListManager().getGpioPin(buttonLightInt);

    buttonObjectRepository = ButtonObjectR();
    listenToButtonPress();
    logger.i('Button with light object has been created');
  }

  ///  The type of the smart device, Light, blinds, button etc
  @override
  // ignore: overridden_fields
  CbjDeviceTypes? smartDeviceType = CbjDeviceTypes.buttonWithLight;

  /// The light pin around the button.
  PinInformation? buttonLight;

  /// Will determine when to light the button light
  CbjWhenToExecute whenToLightButtonLight = CbjWhenToExecute.onOddNumberPress;

  /// Number of pins and the types needed
  @override
  List<String> getNeededPinTypesList() => <String>['gpio', 'gpio'];

  static List<String> neededPinTypesList() => <String>['gpio', 'gpio'];

  /// Listen to the button press and execute actions from buttonStateActions
  @override
  Future listenToButtonPress() async {
    if (buttonPin == null) {
      return;
    }

    while (true) {
      await buttonObjectRepository!
          .listenToButtonPress(buttonPin!)
          .then((int exitCode) async {
        await executeOnButtonPress();
      });

      if (whenToLightButtonLight == CbjWhenToExecute.onOddNumberPress &&
          pressStateCounter % 2 != 0) {
      } else if (whenToLightButtonLight == CbjWhenToExecute.evenNumberPress &&
          pressStateCounter.isEven) {
        OnWishU.setOn(deviceInformation, buttonLight);
      } else {
        OffWishU.setOff(deviceInformation, buttonLight);
      }
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }
}
