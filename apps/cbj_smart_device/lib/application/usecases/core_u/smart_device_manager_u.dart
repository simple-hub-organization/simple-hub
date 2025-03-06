import 'package:cbj_smart_device/application/usecases/local_db_u/local_db_u.dart';
import 'package:cbj_smart_device/application/usecases/set_devices_u/set_devices_u.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:cbj_smart_device/application/usecases/smart_server_u/smart_server_u.dart';

import 'package:cbj_smart_device/core/my_singleton.dart';
import 'package:cbj_smart_device/infrastructure/datasources/accounts_information_d/accounts_information_d.dart';

class SmartDeviceManagerU {
  SmartDeviceManagerU() {
    MySingleton();
    _localDbU = LocalDbU();
    _setDevicesUseCase = SetDevicesU();

    _smartServerUseCase = CbjSmartDeviceServerU();

    smartDeviceMainAsync();
  }

  late SetDevicesU _setDevicesUseCase;
  late CbjSmartDeviceServerU _smartServerUseCase;
  late LocalDbU _localDbU;

  Future smartDeviceMainAsync() async {
    final List<SmartDeviceBaseAbstract>? smartDeviceFromDb =
        await _localDbU.getListOfSmartDevices();
    final FirebaseAccountsInformationD? firebaseAccountsInformationD =
        await _localDbU.getListOfDatabaseInformation();

    ///  Setting up all the device from the memory
    _setDevicesUseCase.setAllDevices(deviceList: smartDeviceFromDb);

    ///  Start listen for in incoming connections from the local internet (LAN/Wifi)
    _smartServerUseCase.waitForConnection(firebaseAccountsInformationD);
  }
}
