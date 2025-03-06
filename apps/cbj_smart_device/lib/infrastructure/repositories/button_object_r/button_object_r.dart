import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:cbj_smart_device/infrastructure/datasources/button_object_d/button_object_d.dart';

class ButtonObjectR {
  ButtonObjectR() {
    _buttonObjectDataSource = ButtonObjectD();
  }

  late ButtonObjectD _buttonObjectDataSource;

  Future<int> listenToButtonPress(PinInformation buttonPinNumber) {
    return _buttonObjectDataSource.listenToButtonPress(buttonPinNumber);
  }
}
