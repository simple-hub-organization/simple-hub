import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_simple_abstract.dart';
import 'package:cbj_smart_device/application/usecases/wish_classes_u/dynamic_wish_u.dart';

//  Abstract class for smart devices class with dynamic property
abstract class SmartDeviceDynamicAbstract extends SmartDeviceSimpleAbstract {
  SmartDeviceDynamicAbstract(
    String super.uuid,
    String super.smartInstanceName,
    int super.onOffPinNumber, {
    super.onOffButtonPinNumber,
  });

  ///  Save how much power to do for action
  double? dynamicValue;

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
    return _wishInDynamicClass(deviceAction, deviceState);
  }

  ///  Set dynamic value
  String _setDynamicValue() {
    return DynamicWishU.setDynamic(deviceInformation);
  }

  ///  All the wishes that are legit to execute from the dynamic class
  Future<String> _wishInDynamicClass(
    CbjDeviceActions deviceAction,
    CbjDeviceStateGRPC deviceState,
  ) async {
    switch (deviceAction) {
      case CbjDeviceActions.actionNotSupported:
        return _setDynamicValue();
      default:
        return wishInSimpleClass(deviceAction, deviceState);
    }
  }
}
