import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:cbj_smart_device/core/device_information.dart';
import 'package:cbj_smart_device/domain/entities/wish_classes_e/wish_classes_e.dart';

class OffWishU {
  static String setOff(
    DeviceInformation deviceInformation,
    PinInformation? pinNumber,
  ) {
    pinNumber?.v = 0;
    switch (deviceInformation.runtimeType) {
      case final LocalDevice type:
        return setOffLocal(type, pinNumber);
      case final RemoteDevice type:
        return setOffRemote(type, pinNumber);
    }
    return 'DeviceBase type not supported';
  }

  ///  Turn this device off
  static String setOffLocal(
    LocalDevice deviceInformation,
    PinInformation? pinNumber,
  ) {
    WishClassesE().pinOff(pinNumber);
    return 'Response from this device off sucsessful';
  }

  ///  Change the remote device off
  static String setOffRemote(
    RemoteDevice remoteDevice,
    PinInformation? pinNumber,
  ) {
//    try {
//      HttpClient()
//          .getUrl(Uri.parse('http://' +
//              remoteDevice.getIp() +
//              '/LED=OFF')) // produces a request object
//          .then((request) => request.close()) // sends the request
//          .then((HttpClientResponse response) {
//        print(response.transform(Utf8Decoder()).listen(print));
//      });
//    }
//    catch (e) {
//      print('Exception: ' + e);
//    }
    return 'Response from remote device off sucsessful';
  }
}
