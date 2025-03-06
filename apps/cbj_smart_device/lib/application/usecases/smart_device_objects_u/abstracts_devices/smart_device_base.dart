import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_smart_device/application/usecases/button_object_u/button_object_local_u.dart';
import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:cbj_smart_device/application/usecases/wish_classes_u/off_wish_u.dart';
import 'package:cbj_smart_device/application/usecases/wish_classes_u/on_wish_u.dart';
import 'package:cbj_smart_device/application/usecases/wish_classes_u/smart_computer_wish_u.dart';
import 'package:cbj_smart_device/domain/entities/core_e/enums_e.dart';
import 'package:cbj_smart_device/utils.dart';

///  Abstract class for smart devices that can get actions from commands.
///  Excluding buttons since they are the one that sending the commands.
abstract class SmartDeviceBase extends SmartDeviceBaseAbstract {
  SmartDeviceBase(
    super.id,
    super.deviceName,
    int? onOffPinNumber, {
    int? onOffButtonPinNumber,
  }) {
    onOffPin =
        onOffPinNumber == null ? null : addPinToGpioPinList(onOffPinNumber);

    //  If pin number was inserted and it exists than listen to button press
    if (onOffButtonPinNumber != null) {
      onOffButtonPin = addPinToGpioPinList(onOffButtonPinNumber);

      if (onOffButtonPin != null) {
        listenToButtonPressed();
      }
    }
  }

  ///  Save all the gpio pins that this instance is using
  final List<PinInformation> _gpioPinList = <PinInformation>[];

  /// Get a list of the pins Types that this device need
  @override
  List<String> getNeededPinTypesList() => [];

  static List<String> neededPinTypesList() => [];

  //  Getters

  ///  Get smart device type
  CbjDeviceTypes? getDeviceType() => smartDeviceType;

  /// Returning the non abstract of this object
  @override
  Type getTheNonAbstractObjectOfThisInstance() {
    return EnumHelper.getTheNonAbstractObjectOfSmartDeviceBaseAbstract(
      this,
      getDeviceType()!,
    );
  }

  ///  Get the list of gpio pin of the device
  @override
  List<PinInformation> getGpioPinList() {
    return _gpioPinList;
  }

  @override
  Future<String> getUuid() {
    return SystemCommandsBaseClassD.instance.getUuidOfCurrentDevice();
  }

  bool getDeviceState() => onOff;

  //  Setters

  ///  Turn on the device basic action
  String _setOn(PinInformation? pinNumber) {
//    if (deviceInformation == null) {
//      return 'Entity information is missing, can't turn on';
//    }
    OnWishU.setOn(deviceInformation, pinNumber);
    onOff = true;
    return 'Turn on successfully';
  }

  ///  Turn off the device basic action
  String _setOff(PinInformation? pinNumber) {
//    if (deviceInformation == null) {
//      return 'Entity information is missing, can't turn off';
//    }
    OffWishU.setOff(deviceInformation, pinNumber);
    onOff = false;
    return 'Turn off successfully';
  }

  ///  Suspend computer basic action
  Future<String?> _suspendComputer() {
    return SmartComputerWishU.suspendComputer(deviceInformation);

    // return 'Suspend computer successfully';
  }

  ///  Shutdown computer basic action
  Future<String?> _shutdownComputer() {
    return SmartComputerWishU.shutdownComputer(deviceInformation);
  }

  set deviceType(CbjDeviceTypes? deviceType) => smartDeviceType = deviceType;

  CbjDeviceTypes? get deviceType => smartDeviceType;

  ///  Turn device pin to the opposite state
  String _setChangeOppositeToState(PinInformation? pinNumber) {
    return onOff ? _setOff(onOffPin) : _setOn(onOffPin);
  }

  //  More functions

  ///  Add gpio pin for this device
  PinInformation? addPinToGpioPinList(int pinNumber) {
    //  Check if pin is free to be taken,
    //  if not return negative number with error number
    // final PinInformation gpioPin =
    //     DevicePinListManager().getGpioPin(pinNumber)!;
    // _gpioPinList.add(gpioPin);
    // return gpioPin;
    return null;
  }

  ///  Return PossibleWishes object if
  ///  string wish exist (in general) else return null
  CbjDeviceActions? convertWishStringToWishesObject(String wish) {
    for (final CbjDeviceActions possibleAction in CbjDeviceActions.values) {
      logger.i('Wish value ${EnumHelper.deviceActionToString(possibleAction)}');
      if (EnumHelper.deviceActionToString(possibleAction) == wish) {
        return possibleAction; //  If wish exist return the PossibleWish object
      }
    }
    return null;
  }

  ///  Check if wish exist at all if true than check if base abstract have
  ///  this wish and if true than execute it
  Future<String> executeActionString(
    String wishString,
    CbjDeviceStateGRPC deviceState,
  ) async {
    final CbjDeviceActions action =
        convertWishStringToWishesObject(wishString)!;
    return executeDeviceAction(action, deviceState);
  }

  Future<String> executeDeviceAction(
    CbjDeviceActions action,
    CbjDeviceStateGRPC deviceState,
  ) async {
    return wishInBaseClass(action, deviceState);
  }

  ///  All the wishes that are legit to execute from the base class
  Future<String> wishInBaseClass(
    CbjDeviceActions action,
    CbjDeviceStateGRPC deviceState,
  ) async {
    String executionMassage = ' ';

    getDeviceState();
    String? resultOfTheWish = '';

    switch (action) {
      case CbjDeviceActions.off:
        if (onOffPin == null) {
          executionMassage = 'Cant turn off this pin: $onOffPin Number';
        }
        resultOfTheWish = _setOff(onOffPin);
      case CbjDeviceActions.on:
        if (onOffPin == null) {
          executionMassage = 'Cant turn on this pin: $onOffPin Number';
        }
        resultOfTheWish = _setOn(onOffPin);
      case CbjDeviceActions.suspend:
        resultOfTheWish = await _suspendComputer();
      case CbjDeviceActions.shutdown:
        resultOfTheWish = await _shutdownComputer();
      case CbjDeviceActions.actionNotSupported:
        if (onOffPin == null) {
          executionMassage =
              'Cant change pin to the opposite state: $onOffPin Number';
        }
        resultOfTheWish = _setChangeOppositeToState(onOffPin);
      default:
        executionMassage = 'Your wish does not exist for this class';
    }

    logger.i(
      'Execution massage: $executionMassage\nResult of the wish:$resultOfTheWish',
    );

    if (resultOfTheWish == 'Turn on successfully' ||
        resultOfTheWish == 'Turn off successfully' ||
        executionMassage == 'Cant turn on this pin: null Number' ||
        executionMassage == 'Cant turn off this pin: null Number') {
      if (deviceState == CbjDeviceStateGRPC.waitingInComp) {
        // if (action == CbjDeviceActions.on) {
        //   final Map<String, String> mapToUpdate = {
        //     GrpcClientTypes.cbjDeviceActionsTypeString:
        //         CbjDeviceActions.on.toString(),
        //     GrpcClientTypes.cbjDeviceStateGRPCTypeString:
        //         CbjDeviceStateGRPC.ack.toString()
        //   };
        // } else if (action == CbjDeviceActions.off) {
        //   final Map<String, String> mapToUpdate = {
        //     GrpcClientTypes.cbjDeviceActionsTypeString:
        //         CbjDeviceActions.off.toString(),
        //     GrpcClientTypes.cbjDeviceStateGRPCTypeString:
        //         CbjDeviceStateGRPC.ack.toString()
        //   };
        // }
      } else if (deviceState == CbjDeviceStateGRPC.ack) {
      } else {}
    } else {}

    return executionMassage;
  }

  ///  Listen to button press
  Future listenToButtonPressed() async {
    ButtonObjectLocalU().buttonPressed(this, onOffButtonPin!, onOffPin!);
  }
}
