import 'dart:core';

import 'package:cbj_smart_device/application/usecases/devices_pin_configuration_u/pin_information.dart';
import 'package:cbj_smart_device/utils.dart';

///  This class is abstract, it manages all the pins list types both what exist
///  and what in use, getting pin number should be through here
abstract class DeviceConfigurationBaseClass {
  ///  Pins types lists
  List<PinInformation>? pinList; //  List of all the pins on the device

  //  Getters

  List<PinInformation>? getGPIOList() => pinList;

  ///  Get the gpio pin if not in used and set it to used, else return null
  PinInformation? getGpioPin(int pinNumber) {
    final PinInformation? pinInformation =
        getPinInformationByPinNumber(pinNumber);

    if (pinInformation == null) {
      return null;
    }

    final int isTheGpioPinFree = isGpioPinFree(pinNumber);
    logger.i('Pin is ${pinInformation.pinAndPhysicalPinConfiguration}');
    if (isTheGpioPinFree != 0) {
      throw 'Cant use this pin $pinNumber error code $isTheGpioPinFree';
    }

    pinInformation.isInUse = true;

    return pinInformation;
  }

  /// Get PinInformation object that have pin number,
  /// if does not exist return null
  PinInformation? getPinInformationByPinNumber(int? pinNumber) {
    for (final PinInformation pinInformation in pinList!) {
      if (pinInformation.pinAndPhysicalPinConfiguration == pinNumber) {
        return pinInformation;
      }
    }
    return null;
  }

  bool isPinGpio(PinInformation pinInformation) =>
      isPinSpecificCategory(pinInformation, 'gpio') &&
      isPinSpecificType(pinInformation, 'gpio');

  bool isPinSpecificCategory(
    PinInformation pinInformation,
    String pinCategory,
  ) {
    final String pinCategoryLowerCase = pinCategory.toLowerCase();
    return pinInformation.category!
        .toLowerCase()
        .contains(pinCategoryLowerCase);
  }

  bool isPinSpecificType(PinInformation pinInformation, String pinType) =>
      pinInformation.name!.toLowerCase().contains(pinType.toLowerCase());

  ///  Get gpio pin number, if pin is gpio and free return the pin number,
  ///  if pin does not exist return -1, if pin is not gpio pin return -2,
  ///  if pin is in use as gpio return -3
  int isGpioPinFree(int? pinNumber) {
    final PinInformation? pinInformation =
        getPinInformationByPinNumber(pinNumber);

    //  If pin does not exist return -1
    if (pinInformation == null) {
      return -1;
    }

    //  If pin is not gpio pin return -2
    if (!isPinGpio(pinInformation)) {
      return -2;
    }

    //  If pin is already in use return -3
    if (pinInformation.isInUse!) {
      return -3;
    }

    return 0;
  }

  /// Get the next free gpio from the device configuration method.
  PinInformation? getNextFreeGpioPin({List<PinInformation?>? ignorePinsList});

  /// Will return the next gpio in the created order without the override part
  /// that the device configuration have.
  PinInformation? getNextFreeGpioPinHelper(
    List<PinInformation> pinInformationList, {
    List<PinInformation?>? ignorePinsList,
  }) {
    for (final PinInformation pinInformation in pinInformationList) {
      if (isGpioPinFree(pinInformation.pinAndPhysicalPinConfiguration) >= 0 &&
          doesPinExistInPinList(pinInformation, ignorePinsList) == null) {
        return pinInformation;
      }
    }
    logger.i("There isn't free gpio");
    return null;
  }

  /// Return if pinInformation pinAndPhysicalPinConfiguration value exist in
  /// pinsList PinInformation List
  PinInformation? doesPinExistInPinList(
    PinInformation pinInformation,
    List<PinInformation?>? pinsList,
  ) {
    if (pinsList != null && pinsList.isNotEmpty) {
      for (final PinInformation? pinToIgnore in pinsList) {
        if (pinToIgnore!.pinAndPhysicalPinConfiguration ==
            pinInformation.pinAndPhysicalPinConfiguration) {
          return pinToIgnore;
        }
      }
    }
    return null;
  }
}
