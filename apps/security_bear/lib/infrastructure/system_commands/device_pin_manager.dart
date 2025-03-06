import 'package:security_bear/domain/generic_devices/device_type_enums.dart';
import 'package:security_bear/infrastructure/system_commands/system_commands_manager_d.dart';
import 'package:security_bear/utils.dart';

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
    final SystemCommandsManager systemCommandsManager = SystemCommandsManager();
    final String etcReleaseOutput =
        await systemCommandsManager.getAllEtcReleaseFilesText();

    final List<String> etcReleaseFilesAsList = etcReleaseOutput.split('\n');
    try {
      String deviceHostName = etcReleaseFilesAsList.firstWhere(
        (etcReleaseSingleLine) => etcReleaseSingleLine.contains('BOARD'),
      );
      deviceHostName =
          deviceHostName.substring(deviceHostName.indexOf('=') + 1);
      logger.v('Now');
      logger.v(deviceHostName);
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

      logger.v('phys type is $physicalDeviceType');
    } catch (e) {
      logger.w('Board type does not exist');
    }
    logger.i(
      'This device is of type:'
      ' ${EnumHelper.physicalDeviceTypeToString(physicalDeviceType)}',
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
      if (EnumHelper.physicalDeviceTypeToString(physicalDeviceTypeTemp)
              .toLowerCase() ==
          physicalDeviceType.toLowerCase()) {
        return physicalDeviceTypeTemp; //  If physicalDeviceType string exist
        // return the physicalDeviceType enum object
      }
    }
    return null;
  }
}
