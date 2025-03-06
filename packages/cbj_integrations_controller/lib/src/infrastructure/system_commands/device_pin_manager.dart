import 'package:cbj_integrations_controller/src/infrastructure/core/utils.dart';
import 'package:cbj_integrations_controller/src/infrastructure/system_commands/computer_type_utility.dart';
import 'package:cbj_integrations_controller/src/infrastructure/system_commands/system_commands_base_class_d.dart';

///  This class save all the configuration of the pins per device,
///  every device have different pin for each task,
///  and these class will give the correct pin for the task.
///  Also these class will manage unused pins for new connections and
///  will return free pins number for the required task.

///  Also these class manage the pins,
///  and check if this pin is in the type that the user needs (gpio and more),
///  If pin is not in use and in the correct type that user expect it return the
///  number of the pin, else return -1

abstract class DevicePinListManagerAbstract {
  ///  Will save the type of the current physical device
  static PhysicalDeviceType? physicalDeviceType;

  /// Set recognize and set the physical device type in the singleton
  Future setPhysicalDeviceType();

  PhysicalDeviceType? convertPhysicalDeviceTypeStringToPhysicalDeviceTypeObject(
    String physicalDeviceType,
  );
}

class DevicePinListManager extends DevicePinListManagerAbstract {
  ///  Will save the type of the current physical device
  static PhysicalDeviceType? physicalDeviceType;

  @override
  Future setPhysicalDeviceType() async {
    // TODO: check if this can be done using
    // https://pub.dev/packages/flutter_gpiod or by using
    // https://pub.dev/packages/linux_system_info
    final SystemCommandsBaseClassD systemCommandsManager =
        SystemCommandsBaseClassD.instance;
    final String etcReleaseOutput =
        await systemCommandsManager.getAllEtcReleaseFilesText();

    final List<String> etcReleaseFilesAsList = etcReleaseOutput.split('\n');
    try {
      String deviceHostName = etcReleaseFilesAsList.firstWhere(
        (etcReleaseSingleLine) => etcReleaseSingleLine.contains('BOARD'),
      );
      deviceHostName =
          deviceHostName.substring(deviceHostName.indexOf('=') + 1);
      icLogger.t(deviceHostName);
      deviceHostName = deviceHostName.replaceAll('-', '').replaceAll(' ', '');

      physicalDeviceType =
          convertPhysicalDeviceTypeStringToPhysicalDeviceTypeObject(
        deviceHostName,
      );

      final String? raspberryPiVersion =
          await systemCommandsManager.getRaspberryPiDeviceVersion();

      if (physicalDeviceType == null &&
          raspberryPiVersion != null &&
          raspberryPiVersion
              .toLowerCase()
              .contains('Raspberry_Pi'.toLowerCase())) {
        physicalDeviceType = PhysicalDeviceType.raspberryPi;
      }

      icLogger.t('phys type is $physicalDeviceType');
    } catch (e) {
      icLogger.w('Board type does not exist');
    }
    icLogger.i(
      'This device is of type:'
      ' ${ComputerTypeUtility.physicalDeviceTypeToString(physicalDeviceType)}',
    );
  }

  ///  Return physicalDeviceType object if
  ///  string physicalDeviceType exist (in general) else return null
  @override
  PhysicalDeviceType? convertPhysicalDeviceTypeStringToPhysicalDeviceTypeObject(
    String physicalDeviceType,
  ) {
    //  Loop through all the physical devices types
    for (final PhysicalDeviceType physicalDeviceTypeTemp
        in PhysicalDeviceType.values) {
      if (ComputerTypeUtility.physicalDeviceTypeToString(physicalDeviceTypeTemp)
              .toLowerCase() ==
          physicalDeviceType.toLowerCase()) {
        return physicalDeviceTypeTemp; //  If physicalDeviceType string exist
        // return the physicalDeviceType enum object
      }
    }
    return null;
  }
}
