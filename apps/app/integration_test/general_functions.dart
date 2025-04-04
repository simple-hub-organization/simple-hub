import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:simple_hub/infrastructure/core/logger.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';

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

  static Future clickButton({
    required WidgetTester tester,
    required String text,
    Type buttonType = ButtonAtom,
  }) async {
    final Finder nextButtonFinder = find.widgetWithText(buttonType, text);
    expect(nextButtonFinder, findsOneWidget);
    await tester.tap(nextButtonFinder);
    await tester.pumpAndSettle();
  }
}
