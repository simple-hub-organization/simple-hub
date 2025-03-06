import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:cbj_smart_device/infrastructure/repositories/wish_classes_r/turn_pin_on_off_local.dart';

class WishClassesR {
  Future<String> pinOff(PinInformation? pinNumber) {
    return TurnPinOnOffLocal().pinOff(pinNumber);
  }
}
