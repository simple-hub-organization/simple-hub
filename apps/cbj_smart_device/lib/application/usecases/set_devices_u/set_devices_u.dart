import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/simple_devices/light_object.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/simple_devices/smart_computer_object.dart';
import 'package:cbj_smart_device/core/my_singleton.dart';
import 'package:cbj_smart_device/domain/entities/set_devices_e/set_devices_e.dart';
import 'package:cbj_smart_device/utils.dart';
import 'package:uuid/uuid.dart';

/// This class will load all saved smart devices objects from file at startup into the program
class SetDevicesU {
//  TODO: Pull the saved devices into the app variables

  SetDevicesU() {
    _setDevicesE = SetDevicesE();
  }

  late SetDevicesE _setDevicesE;

  ///  Setting all the devices from saved data
  Future setAllDevices({
    List<SmartDeviceBaseAbstract>? deviceList,
  }) async {
    if (deviceList != null) {
      MySingleton().smartDevicesList = deviceList;
    } else {
      final String? deviceConfiguration =
          await _setDevicesE.getDeviceDefaultConfig();
      if (deviceConfiguration == null || deviceConfiguration.isEmpty) {
        logger.i(
          '\nDefault configuration file content is null or empty so it will act as if this computer is just a smart computer without pin output.\n',
        );

        /// If can't find any device make it computer device
        final String uId = const Uuid().v1();

        final SmartComputerObject smartComputerObject =
            SmartComputerObject(uId, 'Personal Computer');
        MySingleton().smartDevicesList = [smartComputerObject];

        return;
      }
      final List<SmartDeviceBaseAbstract> listOfSmartDevices =
          await _setDevicesE.convertToListOfDevices(deviceConfiguration);
      if (listOfSmartDevices.isNotEmpty) {
        MySingleton().smartDevicesList = listOfSmartDevices;
      }
      logger.i(listOfSmartDevices);
    }
//      manualSetup();
  }

  Future manualSetup() async {
    final String uuid = await _setDevicesE.getCurrentDeviceUUid();

    MySingleton().smartDevicesList = <SmartDeviceBaseAbstract>[
      LightObject(uuid, 'Stairs', 8),
      // ButtonObject(10),
      LightObject(uuid, 'Storage', 12),
      // ButtonObject(14),

//        LightObject('30:23:a2:G3:34', 'Guy ceiling light', 11,
//            onOffButtonPinNumber:
//                2)); // NanoPi Duo2 will be pin 16 for the button

//        .add(BlindsObject(
//        "30:23:a2:G3:34",
//        "Guy ceiling light",
//        null,
//        //  onOffPinNumber
//        null,
//        //  onOffButtonPinNumber
//        8,
//        //  blindsUpPin
//        10,
//        //  upButtonPinNumber
//        12,
//        //  blindsDownPin
//        14 // downButtonPinNumber
//    )); // NanoPi Duo2
    ];
  }
}
