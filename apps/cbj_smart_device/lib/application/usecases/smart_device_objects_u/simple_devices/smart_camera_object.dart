import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_simple_abstract.dart';
import 'package:cbj_smart_device/utils.dart';

class SmartCameraObject extends SmartDeviceSimpleAbstract {
  SmartCameraObject(
    String? uuid,
    String? smartInstanceName,
  ) : super(
          uuid,
          smartInstanceName,
          null,
          onOffButtonPinNumber: null,
        ) {
    deviceType = CbjDeviceTypes.smart_camera;
    logger.i('New smart camera');
  }

  @override
  List<String> getNeededPinTypesList() => <String>[];

  ///  Return smart device type
  @override
  CbjDeviceTypes getDeviceType() => CbjDeviceTypes.smart_camera;

  @override
  Future<String> executeActionString(
    String wishString,
    CbjDeviceStateGRPC deviceState,
  ) async {
    final CbjDeviceActions deviceAction =
        convertWishStringToWishesObject(wishString)!;
    return executeDeviceAction(deviceAction, deviceState);
  }

  @override
  Future<String> executeDeviceAction(
    CbjDeviceActions deviceAction,
    CbjDeviceStateGRPC deviceState,
  ) async {
    return wishInSimpleClass(deviceAction, deviceState);
  }
}
