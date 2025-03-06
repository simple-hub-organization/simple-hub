import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base.dart';
import 'package:cbj_smart_device/utils.dart';

///  Abstract class for devices with property of how much to move and without
///  how much time the device is doing action without stopping
abstract class SmartDeviceStaticAbstract extends SmartDeviceBase {
  SmartDeviceStaticAbstract(
    String? uuid,
    smartInstanceName,
    onOffPinNumber, {
    onOffButtonPinNumber,
  }) : super(
          uuid,
          smartInstanceName as String?,
          onOffPinNumber as int?,
          onOffButtonPinNumber: onOffButtonPinNumber as int?,
        );

  //  TODO: set how much to move
  String _howMuchToMove() {
    return 'How much to move not supported yet';
//    if(deviceInformation == null) {
//      return "Device information is missing, cant trun off";
//    }
//    DynamicWish.OpenDynamic(deviceInformation);
//    onOff = false;
//    return 'Turn on sucsessfuly';
  }

  ///  All the wishes that are legit to execute from the static class
  @override
  Future<String> executeActionString(
    String wishString,
    CbjDeviceStateGRPC deviceState,
  ) async {
    final wish = convertWishStringToWishesObject(wishString);
    logger.i(wishString);
    logger.i(wish.toString());
    if (wish == null) return 'Your wish does not exist on static class';
    return executeDeviceAction(wish, deviceState);
  }

  @override
  Future<String> executeDeviceAction(
    CbjDeviceActions deviceAction,
    CbjDeviceStateGRPC deviceState,
  ) async {
    return wishInStaticClass(deviceAction, deviceState);
  }

  Future<String> wishInStaticClass(
    CbjDeviceActions deviceAction,
    CbjDeviceStateGRPC deviceState,
  ) async {
    switch (deviceAction) {
      case CbjDeviceActions.stop:
        return _howMuchToMove();
      default:
        return wishInBaseClass(deviceAction, deviceState);
    }
  }
}
