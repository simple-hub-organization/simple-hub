import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_smart_device/core/device_information.dart';

///  Class to change wish on status to device
class SmartComputerWishU {
  ///  Suspend the computer
  static Future<String?> suspendComputer(
    DeviceInformation deviceInformation,
  ) {
    return SystemCommandsBaseClassD.instance.suspendComputer();
    // return 'Response from this device suspend successful';
  }

  ///  Shut down the computer
  static Future<String?> shutdownComputer(
    DeviceInformation deviceInformation,
  ) {
    return SystemCommandsBaseClassD.instance.shutdownComputer();
  }
}
