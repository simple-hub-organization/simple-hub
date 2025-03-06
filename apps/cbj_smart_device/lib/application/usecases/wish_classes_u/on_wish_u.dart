import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:cbj_smart_device/core/device_information.dart';
import 'package:cbj_smart_device/infrastructure/repositories/wish_classes_r/turn_pin_on_off_local.dart';
import 'package:cbj_smart_device/utils.dart';

///  Class to change wish on status to device
class OnWishU {
  static String setOn(
    DeviceInformation deviceInformation,
    PinInformation? pinNumber,
  ) {
    pinNumber?.v = 1;

    switch (deviceInformation.runtimeType) {
      case final LocalDevice type:
        return setOnLocal(type, pinNumber);
      case final RemoteDevice type:
        return setOnRemote(type, pinNumber);
    }
    logger.i('Entity type ${deviceInformation.name} is not specified ');

    return 'DeviceBase type not supported';
  }

  ///  Turn this device on
  static String setOnLocal(
    LocalDevice deviceInformation,
    PinInformation? pinNumber,
  ) {
    TurnPinOnOffLocal().pinOn(pinNumber);
    return 'Response from this device on successful';
  }

  ///  Turn the remote device on
  static String setOnRemote(
    RemoteDevice remoteDevice,
    PinInformation? pinNumber,
  ) {
//    try {
//      HttpClient()
//          .getUrl(Uri.parse('http://' +
//              remoteDevice.getIp() +
//              '/LED=ON')) // Produces a request object
//          .then((request) => request.close()) // Sends the request
//          .then((HttpClientResponse response) {
//        print(response.transform(Utf8Decoder()).listen(print));
//      });
//    } catch (e) {
//      print('Exeption: ' + e);
//    }
    return 'Response from remote device on successful';
  }
}
