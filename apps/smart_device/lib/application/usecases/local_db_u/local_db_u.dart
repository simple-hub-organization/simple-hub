import 'package:smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:smart_device/domain/entities/local_db_e/local_db_e.dart';
import 'package:smart_device/infrastructure/datasources/accounts_information_d/accounts_information_d.dart';

class LocalDbU {
  LocalDbU() {
    _localDbE = LocalDbE();
  }

  late LocalDbE _localDbE;

  Future<List<SmartDeviceBaseAbstract>?> getListOfSmartDevices() {
    return _localDbE.getListOfSmartDevices();
  }

  Future<FirebaseAccountsInformationD?> getListOfDatabaseInformation() {
    return _localDbE.getListOfDatabaseInformation();
  }
}
