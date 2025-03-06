import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/simple_devices/boiler_object.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/static_devices/blinds_object.dart';
import 'package:cbj_smart_device/infrastructure/repositories/button_object_r/button_object_r.dart';

abstract class ButtonObjectLocalAbstract {
  ButtonObjectLocalAbstract() {
    buttonObjectRepository = ButtonObjectR();
  }

  ButtonObjectR? buttonObjectRepository;

  void buttonPressed(
    SmartDeviceBase smartDevice,
    PinInformation buttonPinNumber,
    PinInformation lightPin,
  );

  void buttonPressedForBoiler(
    BoilerObject smartDevice,
    PinInformation buttonPinNumber,
    PinInformation lightPin,
  );

  ///  Listen to two buttons but work only if one is pressed.
  void listenToTwoButtonPressedButtOnlyOneCanBePressedAtATime(
    BlindsObject blindsObject,
    PinInformation firstButtonPinNumber,
    PinInformation firstLightPin,
    PinInformation secondButtonPinNumber,
    PinInformation secondLightPin,
  );

  void listenToButtonPressAndChangeBlindStateAccordingly(
    BlindsObject blindsObject,
    PinInformation buttonPinNumber,
    PinInformation firstLightPin,
    PinInformation secondLightPin,
    int buttonNumber,
  );

  ///  Logic of two buttons
  Future changeBlindsPinsOutput(
    BlindsObject blindsObject,
    PinInformation firstLightPin,
    PinInformation secondLightPin,
    int buttonPressNumber,
  );
}
