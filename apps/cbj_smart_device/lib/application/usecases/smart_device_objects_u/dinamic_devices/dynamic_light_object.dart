import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_dynamic_abstract.dart';

class DynamicLightObject extends SmartDeviceDynamicAbstract {
  DynamicLightObject(
    super.uuid,
    super.smartInstanceName,
    super.onOffPinNumber, {
    super.onOffButtonPinNumber,
  });
}
