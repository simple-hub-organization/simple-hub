import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:cbj_smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/getting_signals_from_pins/listen_to_pin_high_wiring_pi_setup_phys.dart';

class ButtonObjectD {
  ButtonObjectD() {
    _listenToButtonClick = ListenToPinHighWiringPiSetupPhys();
  }

  late ListenToPinHighWiringPiSetupPhys _listenToButtonClick;

  Future<int> listenToButtonPress(PinInformation buttonPinNumber) {
    return _listenToButtonClick.listenToButtonPress(
      buttonPinNumber.pinAndPhysicalPinConfiguration.toString(),
    );
  }
}
