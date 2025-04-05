import 'package:smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_dynamic_abstract.dart';

class FanObject extends SmartDeviceDynamicAbstract {
  FanObject(
    super.uuid,
    super.smartInstanceName,
    super.onOffPinNumber, {
    super.onOffButtonPinNumber,
  });
}
