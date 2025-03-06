import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/device_configuration_base_class.dart';
import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';

/// No configuration pins for the un supported devices
class DeviceNotSupportedConfiguration extends DeviceConfigurationBaseClass {
  /// Setting the empty list for the un supported devices
  DeviceNotSupportedConfiguration() {
    pinList = _pinListNanoPiNEOAir;
  }

  static final List<PinInformation> _pinListNanoPiNEOAir = <PinInformation>[];

  @override
  PinInformation? getNextFreeGpioPin({List<PinInformation?>? ignorePinsList}) =>
      getNextFreeGpioPinHelper(pinList!)!;
}
