import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/device_configuration_base_class.dart';
import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';

class NanoPiNeoConfiguration extends DeviceConfigurationBaseClass {
  NanoPiNeoConfiguration() {
    pinList = _pinListNanoPiNeo;
  }

  static final List<PinInformation> _pinListNanoPiNeo = <PinInformation>[];

  @override
  PinInformation getNextFreeGpioPin({List<PinInformation?>? ignorePinsList}) =>
      getNextFreeGpioPinHelper(pinList!, ignorePinsList: ignorePinsList)!;
}
