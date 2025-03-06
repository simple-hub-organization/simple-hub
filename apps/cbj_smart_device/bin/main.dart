import 'dart:io';

import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_smart_device/application/usecases/core_u/smart_device_manager_u.dart';
import 'package:cbj_smart_device/utils.dart';

void main(List<String> arguments) async {
  logger.i('Smart device is activated');

  try {
    // configureNetworkTools('network_tools_db');
    // setInstanceForDartNative();
    SharedVariables()
        .asyncConstructor(arguments.firstOrNull ?? Directory.current.path);
  } catch (error) {
    logger.w('Path/argument 1 is not specified\n$error');
  }

  //  Setting device model and checking if configuration for this model exist
  await DevicePinListManager().setPhysicalDeviceType();

  SmartDeviceManagerU();
}
