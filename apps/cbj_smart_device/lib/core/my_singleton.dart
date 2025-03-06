import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';

class MySingleton {
  factory MySingleton() {
    return _singleton;
  }

  MySingleton._internal() {
    smartDevicesList = <SmartDeviceBaseAbstract>[];
    getUuid();
    getCurrentUserName();
  }

  static final MySingleton _singleton = MySingleton._internal();
  List<SmartDeviceBaseAbstract> smartDevicesList = [];
  Future<String>? _deviceUid;
  Future<String>? _currentUserName;

  Future<String> getUuid() =>
      _deviceUid ??= SystemCommandsBaseClassD.instance.getUuidOfCurrentDevice();

  Future<String?> getCurrentUserName() => _currentUserName ??=
      SystemCommandsBaseClassD.instance.getCurrentUserName();

  void addToSmartDevicesList(SmartDeviceBaseAbstract smartDeviceVal) {
    smartDevicesList.add(smartDeviceVal);
  }
}

class CbjFirebaseAccountInformationFlutter {
  CbjFirebaseAccountInformationFlutter(
    this.fireBaseProjectId,
    this.fireBaseApiKey,
    this.userEmail,
    this.userPassword,
  );

  String fireBaseProjectId;
  String fireBaseApiKey;
  String userEmail;
  String userPassword;

  bool areAllValuesNotNull() {
    return true;
  }
}
