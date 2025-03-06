import 'package:wake_on_lan/wake_on_lan.dart';

/// Standarts api calls to WiFi connected devices
class GeneralApiUtils {
  static Future wakeOnLan({
    required String? mac,
    required String? address,
  }) async {
    if (mac == null || address == null) {
      return;
    }

    final macValidation = MACAddress.validate(mac);
    final ipValidation = IPAddress.validate(address);

    if (macValidation.state && ipValidation.state) {
      final MACAddress macAddress = MACAddress(mac);
      final IPAddress ipAddress = IPAddress(address);

      final WakeOnLAN wakeOnLan = WakeOnLAN(ipAddress, macAddress);

      await wakeOnLan.wake(
        repeat: 3,
        repeatDelay: const Duration(milliseconds: 500),
      );
    }
  }
}
