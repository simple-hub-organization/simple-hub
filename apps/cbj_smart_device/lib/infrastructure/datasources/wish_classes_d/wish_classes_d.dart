import 'dart:io';

import 'package:cbj_smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/pin_setup_method_enum.dart';
import 'package:cbj_smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/sending_signals_to_pins/offSignal/turn_pin_on_wiring_pi_setup.dart';
import 'package:cbj_smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/sending_signals_to_pins/offSignal/turn_pin_on_wiring_pi_setup_gpio.dart';
import 'package:cbj_smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/sending_signals_to_pins/offSignal/turn_pin_on_wiring_pi_setup_phys.dart';
import 'package:cbj_smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/sending_signals_to_pins/offSignal/turn_pin_on_wiring_pi_setup_sys.dart';
import 'package:cbj_smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/sending_signals_to_pins/onSignal/turn_pin_on_wiring_pi_setup.dart';
import 'package:cbj_smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/sending_signals_to_pins/onSignal/turn_pin_on_wiring_pi_setup_gpio.dart';
import 'package:cbj_smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/sending_signals_to_pins/onSignal/turn_pin_on_wiring_pi_setup_phys.dart';
import 'package:cbj_smart_device/infrastructure/datasources/core_d/manage_physical_components/pins_datasource/sending_signals_to_pins/onSignal/turn_pin_on_wiring_pi_setup_sys.dart';

class WishClassesD {
  Future<ProcessResult> turnOnLocalPhysicalPin(
    PinSetupMethodEnum pinSetupMethodEnum,
    String pinNumber,
  ) async {
    switch (pinSetupMethodEnum) {
      case PinSetupMethodEnum.wiringPiSetup:
        {
          return TurnPinOnWiringPiSetup().turnThePinOn(pinNumber);
        }
      case PinSetupMethodEnum.wiringPiSetupGpio:
        {
          return TurnPinOnWiringPiSetupGpio().turnThePinOn(pinNumber);
        }
      case PinSetupMethodEnum.wiringPiSetupPhys:
        {
          return TurnPinOnWiringPiSetupPhys().turnThePinOn(pinNumber);
        }
      case PinSetupMethodEnum.wiringPiSetupSys:
        {
          return TurnPinOnWiringPiSetupSys().turnThePinOn(pinNumber);
        }
      default:
        {
          return TurnPinOnWiringPiSetupGpio().turnThePinOn(pinNumber);
        }
    }
  }

  Future<ProcessResult> turnOffLocalPhysicalPin(
    PinSetupMethodEnum pinSetupMethodEnum,
    String pinNumber,
  ) async {
    switch (pinSetupMethodEnum) {
      case PinSetupMethodEnum.wiringPiSetup:
        {
          return TurnPinOffWiringPiSetup().turnThePinOff(pinNumber);
        }
      case PinSetupMethodEnum.wiringPiSetupGpio:
        {
          return TurnPinOffWiringPiSetupGpio().turnThePinOff(pinNumber);
        }
      case PinSetupMethodEnum.wiringPiSetupPhys:
        {
          return TurnPinOffWiringPiSetupPhys().turnThePinOff(pinNumber);
        }
      case PinSetupMethodEnum.wiringPiSetupSys:
        {
          return TurnPinOffWiringPiSetupSys().turnThePinOff(pinNumber);
        }
      default:
        {
          return TurnPinOffWiringPiSetupGpio().turnThePinOff(pinNumber);
        }
    }
  }
}
