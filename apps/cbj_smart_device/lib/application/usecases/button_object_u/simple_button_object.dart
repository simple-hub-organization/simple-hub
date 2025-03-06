import 'package:cbj_integrations_controller/integrations_controller.dart';
import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';
import 'package:cbj_smart_device/core/my_singleton.dart';
import 'package:cbj_smart_device/infrastructure/repositories/button_object_r/button_object_r.dart';
import 'package:cbj_smart_device/utils.dart';

/// Simple button, without light inside.
class ButtonObject extends SmartDeviceBaseAbstract {
  ButtonObject(
    super.id,
    super.deviceName,
    // int? buttonPinInt,
    {
    this.buttonStatesAction,
  }) {
    // buttonPin = DevicePinListManager().getGpioPin(buttonPinInt);

    buttonObjectRepository = ButtonObjectR();
    listenToButtonPress();
    logger.i('Button object has been created');
  }

  ///  The type of the smart device, Light, blinds, button etc
  @override
  // ignore: overridden_fields
  CbjDeviceTypes? smartDeviceType = CbjDeviceTypes.button;

  /// The button will save list of states like on, off, long press, double tap.
  /// For each button press state we save the smart object and the actions that
  /// we want to preform on it.
  Map<CbjWhenToExecute, Map<SmartDeviceBase, List<CbjDeviceActions>>>?
      buttonStatesAction;

  /// Button pin information to listen to.
  PinInformation? buttonPin;

  /// First press of the button or the second one
  int pressStateCounter = 0;

  /// Save current state of button press
  CbjWhenToExecute currentButtonPressState = CbjWhenToExecute.undefined;

  /// Class to interact with simple button.
  ButtonObjectR? buttonObjectRepository;

  /// Number of pins and the types needed
  @override
  List<String> getNeededPinTypesList() => <String>['gpio'];

  static List<String> neededPinTypesList() => <String>['gpio'];

  /// Listen to the button press and execute actions from buttonStateActions
  Future listenToButtonPress() async {
    if (buttonPin == null) {
      return;
    }

    while (true) {
      await buttonObjectRepository!
          .listenToButtonPress(buttonPin!)
          .then((int exitCode) async {
        await executeOnButtonPress();
      });
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  /// Execute on button press
  Future<String> executeOnButtonPress() async {
    logger.i('Button number ${buttonPin?.pinAndPhysicalPinConfiguration}'
        ' was pressed');
    pressStateCounter++;
    if (pressStateCounter > 2) {
      pressStateCounter = 1;
    }

    if (pressStateCounter % 2 != 0) {
      currentButtonPressState = CbjWhenToExecute.onOddNumberPress;
    } else {
      currentButtonPressState = CbjWhenToExecute.evenNumberPress;
    }

    buttonStatesAction?.forEach((cbjWhenToExecute, smartDeviceAndActionsMap) {
      if (cbjWhenToExecute == currentButtonPressState) {
        if (cbjWhenToExecute == CbjWhenToExecute.onOddNumberPress ||
            cbjWhenToExecute == CbjWhenToExecute.evenNumberPress) {
          smartDeviceAndActionsMap
              .forEach((smartDevice, actionsToExecute) async {
            for (final action in actionsToExecute) {
              logger.i('${smartDevice.deviceName} is now going to execute '
                  '"$actionsToExecute" action');
              await smartDevice.executeDeviceAction(
                action,
                CbjDeviceStateGRPC.waitingInComp,
              );
            }
          });
        }
      }
    });

    return '';
  }

  static Map<CbjWhenToExecute, Map<SmartDeviceBase, List<CbjDeviceActions>>>?
      buttonDefaultStateAction(
    List<SmartDeviceBaseAbstract>? smartDeviceBaseAbstractList,
  ) {
    Map<CbjWhenToExecute, Map<SmartDeviceBase, List<CbjDeviceActions>>>?
        buttonStatesAction;

    List<SmartDeviceBaseAbstract> smartDeviceBaseAbstractListTemp;

    if (smartDeviceBaseAbstractList != null) {
      smartDeviceBaseAbstractListTemp = smartDeviceBaseAbstractList;
    } else {
      smartDeviceBaseAbstractListTemp = MySingleton().smartDevicesList;
    }
    if (smartDeviceBaseAbstractListTemp.last.smartDeviceType ==
        CbjDeviceTypes.light) {
      if (smartDeviceBaseAbstractListTemp.last is SmartDeviceBase) {
        final SmartDeviceBase smartDeviceBaseTemp =
            smartDeviceBaseAbstractListTemp.last as SmartDeviceBase;
        buttonStatesAction = {
          CbjWhenToExecute.onOddNumberPress: {
            smartDeviceBaseTemp: [CbjDeviceActions.on],
          },
          CbjWhenToExecute.evenNumberPress: {
            smartDeviceBaseTemp: [CbjDeviceActions.off],
          },
        };
      }
    } else {
      logger.i('Button with light will not work, last object does not'
          ' support this type');
    }
    return buttonStatesAction;
  }
}
