///  List of all physical devices types
enum PhysicalDeviceType {
  nanoPiDuo2,
  nanoPiAir,
  nanoPiNeo,
  nanoPiNeo2,
  raspberryPi,
  notSupported,
}

enum RaspberryPiType {
  raspberryPi3ModelBRev1_2,
  raspberryPi4ModelBRev1_4,
}

class ComputerTypeUtility {
  ///  Convert physicalDeviceType to string
  static String physicalDeviceTypeToString(PhysicalDeviceType? deviceType) {
    return deviceType.toString().replaceAll('PhysicalDeviceType.', '');
  }
}
