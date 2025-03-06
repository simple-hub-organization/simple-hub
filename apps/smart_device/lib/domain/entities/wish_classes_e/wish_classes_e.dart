import 'package:smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:smart_device/infrastructure/repositories/wish_classes_r/wish_classes_r.dart';

class WishClassesE {
  WishClassesE() {
    _wishClassesR = WishClassesR();
  }

  late WishClassesR _wishClassesR;

  Future<String> pinOff(PinInformation? pinNumber) {
    return _wishClassesR.pinOff(pinNumber);
  }
}
