import 'package:integrations_controller/integrations_controller.dart';
import 'package:smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_simple_abstract.dart';
import 'package:smart_device/utils.dart';

class SmartComputerObject extends SmartDeviceSimpleAbstract {
  SmartComputerObject(
    String? uuid,
    String? smartInstanceName,
  ) : super(
          uuid,
          smartInstanceName,
          null,
          onOffButtonPinNumber: null,
        ) {
    deviceType = CbjDeviceTypes.smartComputer;
    logger.i('New smart computer object');
  }

  @override
  List<String> getNeededPinTypesList() => <String>[];

  static List<String> neededPinTypesList() => <String>[];

  ///  Return smart device type
  @override
  CbjDeviceTypes getDeviceType() => CbjDeviceTypes.smartComputer;

  @override
  Future<String> executeActionString(
    String wishString,
    CbjDeviceStateGRPC deviceState,
  )  {
    final CbjDeviceActions deviceAction =
        convertWishStringToWishesObject(wishString)!;
    return executeDeviceAction(deviceAction, deviceState);
  }

  @override
  Future<String> executeDeviceAction(
    CbjDeviceActions deviceAction,
    CbjDeviceStateGRPC deviceState,
  )  {
    return wishInSimpleClass(deviceAction, deviceState);
  }
}
