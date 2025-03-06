import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:cbj_smart_device/core/device_information.dart';
import 'package:cbj_smart_device/core/permissions/permissions_manager.dart';
import 'package:cbj_smart_device/domain/entities/core_e/enums_e.dart';

///  The super base class of all the smart device class and
///  smart device abstract classes
abstract class SmartDeviceBaseAbstract {
  SmartDeviceBaseAbstract(this.id, this.deviceName);

  ///  Save data about the device, remote or local IP or pin number
  DeviceInformation deviceInformation =
      LocalDevice('This is the mac Address', '');

  ///  Unique id of the device
  String? id;

  /// Name of the device
  String? deviceName;

  ///  Mac addresses of the physical device
  String? uuid;

  ///  Permissions of all the users to this device
  Map<String, PermissionsManager>? devicePermissions;

  ///  Power consumption of the device
  double? watts;

  ///  How much time the computer is on since last boot
  DateTime? computerActiveTime;

  ///  How much time the smart device was active (Doing action) total
  DateTime? activeTimeTotal;

  ///  Log of all the actions the device was and will do
  Map<DateTime, Function>? activitiesLog;

  ///  Save the device state on = true, off = false of onOffPin
  bool onOff = false;

  ///  Number of on or off pin
  PinInformation? onOffPin;

  ///  Pin for the button that control the onOffPin
  PinInformation? onOffButtonPin;

  ///  Save all the gpio pins that this instance is using
  final List<PinInformation> _gpioPinList = <PinInformation>[];

  ///  The type of the smart device Light blinds etc
  CbjDeviceTypes? smartDeviceType;

  /// Get a list of the pins Types that this device need
  List<String> getNeededPinTypesList() => [];

  /// Same as getNeededPinTypesList but static
  static List<String> neededPinTypesList() => [];

  //  Getters

  /// Returning the non abstract of this object
  Type getTheNonAbstractObjectOfThisInstance() {
    return EnumHelper.getTheNonAbstractObjectOfSmartDeviceBaseAbstract(
      this,
      smartDeviceType!,
    );
  }

  ///  Get the list of gpio pin of the device
  List<PinInformation> getGpioPinList() {
    return _gpioPinList;
  }

  Future<String> getUuid() {
    return SystemCommandsBaseClassD.instance.getUuidOfCurrentDevice();
  }
}
