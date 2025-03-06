import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base.dart';

class ActionsToPreformU {
  static Future<String> executeDeviceAction(
    SmartDeviceBase smartDevice,
    CbjDeviceActions deviceAction,
    CbjDeviceStateGRPC deviceStateSource,
  ) async {
    final deviceStatus =
        await smartDevice.executeDeviceAction(deviceAction, deviceStateSource);
    return deviceStatus;
  }
}
