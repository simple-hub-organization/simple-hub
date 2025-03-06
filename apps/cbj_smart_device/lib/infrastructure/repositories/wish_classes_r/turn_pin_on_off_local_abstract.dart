import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';

abstract class TurnPinOnOffLocalAbstract {
  Future<String> pinOn(PinInformation pinNumber);

  Future<String> pinOff(PinInformation pinNumber);
}
