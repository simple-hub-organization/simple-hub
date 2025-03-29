import 'package:flutter_test/flutter_test.dart';
import 'package:simple_hub/main.dart' as app;

import 'general_functions.dart';

void main() {
  testWidgets('Navigate and take screenshots', (WidgetTester tester) async {
    app.main(debugBanner: false);

    /// Welcome page
    await tester.pumpAndSettle();
    GeneralFunctions.takeScreenshot('1_welcome_page');
  });
}
