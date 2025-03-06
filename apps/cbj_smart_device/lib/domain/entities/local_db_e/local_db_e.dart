import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:cbj_smart_device/infrastructure/datasources/accounts_information_d/accounts_information_d.dart';
import 'package:cbj_smart_device/infrastructure/repositories/local_db_r/local_db_r.dart';

class LocalDbE {
  LocalDbE() {
    _localDbR = LocalDbR();
  }

  late LocalDbR _localDbR;

  Future<List<SmartDeviceBaseAbstract>?> getListOfSmartDevices() async {
    final List<SmartDeviceBaseAbstract>? smartDeviceList =
        await _localDbR.getListOfSmartDevices();
    return smartDeviceList;
  }

  Future<FirebaseAccountsInformationD?> getListOfDatabaseInformation() async {
    final FirebaseAccountsInformationD? firebaseAccountsInformationD =
        await _localDbR.getListOfDatabaseInformation();
    return firebaseAccountsInformationD;
  }

  Future saveAllDevices(
    List<SmartDeviceBaseAbstract> smartDevicesList,
  ) async {
    await _localDbR.saveAllDevices(smartDevicesList);
    return;
  }

  void saveListOfDatabaseInformation(
    FirebaseAccountsInformationD firebaseAccountsInformationD,
  ) {
    _localDbR.saveListOfDatabaseInformation(firebaseAccountsInformationD);
  }
}
