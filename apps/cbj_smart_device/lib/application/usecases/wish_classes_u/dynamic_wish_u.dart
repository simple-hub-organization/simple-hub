import 'package:cbj_smart_device/core/device_information.dart';

class DynamicWishU {
  static String setDynamic(DeviceInformation deviceInformation) {
    switch (deviceInformation.runtimeType) {
      case final RemoteDevice type:
        return setDynamicRemote(type);
      case final LocalDevice type:
        return setDynamicLocal(type);
    }
    return 'DeviceBase type not supported';
  }

  ///  One time per request change of the local dynamic value
  static String setDynamicLocal(DeviceInformation deviceInformation) {
    return 'Response from local dynamic sucsessful';
  }

  ///  One time per request change of the remote dynamic value
  static String setDynamicRemote(DeviceInformation deviceInformation) {
    return 'Response from remote device dynamic sucsessful';
  }

  static String openDynamic(DeviceInformation deviceInformation) {
    return 'Response open dynamic not supported yet';
  }

//  TODO: Open connection for fluid local dynamic value change

//  TODO: Open connection for fluid remote dynamic value change
}
