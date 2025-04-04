import 'dart:io';

import 'package:vibration/vibration.dart';

part 'package:simple_hub/infrastructure/vibration_repository.dart';

abstract class VibrationController {
  static VibrationController? _instance;

  static VibrationController get instance =>
      _instance ??= _VibrationRepository();

  late bool supported;

  Future init();

  Future vibrate(VibrationType type);
}

enum VibrationType { light, medium, heavy }
