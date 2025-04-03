import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_hub/domain/connections_service.dart';
import 'package:simple_hub/main.dart' as app;

import 'domain_test/test_manage_network_repository.dart';
import 'domain_test/test_network_manager.dart';
import 'domain_test/test_network_utilities_repository.dart';
import 'general_functions.dart';

void main() {
  testWidgets('Navigate and take screenshots', (WidgetTester tester) async {
    TestNetworkUtilitiesRepository();
    TestIManageNetworkRepository();
    TestNetworkManagerRepository();
    ConnectionsService.setCurrentConnectionType(
      networkBssid: '',
      connectionType: ConnectionType.demo,
    );

    app.main(debugBanner: false);

    /// Intro page
    await tester.pumpAndSettle(const Duration(seconds: 20));
    // GeneralFunctions.takeScreenshot('1_welcome_page');
    await GeneralFunctions.clickButton(
        tester: tester, text: 'Next', buttonType: TextButton);
    await GeneralFunctions.clickButton(
        tester: tester, text: 'Done', buttonType: TextButton);

    /// Search Hub Page
    // await GeneralFunctions.clickButton(tester: tester, text: 'More');

    await GeneralFunctions.clickButton(
        tester: tester, text: '4 rgbwLightss', buttonType: GestureDetector);

    /// Home Page

    /// Light Switch Page
  });
}
