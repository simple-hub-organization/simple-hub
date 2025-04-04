part of 'package:simple_hub/domain/controllers/vibration_controller.dart';

class _VibrationRepository extends VibrationController {
  @override
  Future init() async => supported = Platform.isAndroid || Platform.isIOS;

  @override
  Future vibrate(VibrationType type) async {
    if (!supported) {
      return;
    }

    switch (type) {
      case VibrationType.light:
        Vibration.vibrate(amplitude: 128);
      case VibrationType.medium:
        Vibration.vibrate(duration: 501);
      case VibrationType.heavy:
        Vibration.vibrate(duration: 1000);
    }
  }
}
