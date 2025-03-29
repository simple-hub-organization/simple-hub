import 'dart:io';

import 'package:integration_test/integration_test.dart';
import 'package:simple_hub/infrastructure/core/logger.dart';

class GeneralFunctions {
  static final IntegrationTestWidgetsFlutterBinding binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Define a method to take screenshots
  static Future<void> takeScreenshot(String screenshotName) async {
    if (Platform.isLinux) {
      logger.i('Screenshot not supported on linux');
      return;
    }

    final Directory path = Directory('/tmp/flutter_app_screenshots');
    if (!path.existsSync()) {
      path.createSync(recursive: true);
    }

    final file = File('${path.path}/$screenshotName.png');
    final List<int> bytes = await binding.takeScreenshot(screenshotName);
    await file.writeAsBytes(bytes);
    logger.i('Screenshot saved: ${file.path}');
  }
}
