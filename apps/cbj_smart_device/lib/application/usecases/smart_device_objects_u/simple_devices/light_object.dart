import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_simple_abstract.dart';
import 'package:cbj_smart_device/utils.dart';

class LightObject extends SmartDeviceSimpleAbstract {
  LightObject(
    super.uuid,
    super.smartInstanceName,
    super.onOffPinNumber,
  ) : super(
          onOffButtonPinNumber: null,
        ) {
    deviceType = CbjDeviceTypes.light;
    logger.i('New light object');
  }

  @override
  List<String> getNeededPinTypesList() => <String>['gpio'];

  static List<String> neededPinTypesList() => <String>['gpio'];

  ///  Return smart device type
  @override
  CbjDeviceTypes getDeviceType() => CbjDeviceTypes.light;

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
