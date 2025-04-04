import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_hub/domain/connections_service.dart';
import 'package:simple_hub/main.dart' as app;
import 'package:simple_hub/presentation/atoms/atoms.dart';

import 'domain_test/test_manage_network_repository.dart';
import 'domain_test/test_network_manager.dart';
import 'domain_test/test_network_utilities_repository.dart';
import 'domain_test/test_vendor_connector_conjecture_repository.dart';
import 'general_functions.dart';

void main() {
  testWidgets('Navigate and take screenshots', (WidgetTester tester) async {
    TestNetworkUtilitiesRepository();
    TestIManageNetworkRepository();
    TestNetworkManagerRepository();
    TestVendorConnectorConjectureRepository().asyncConstructor();
    ConnectionsService.setCurrentConnectionType(
      networkBssid: '',
      connectionType: ConnectionType.demo,
    );

    app.main(debugBanner: false);

    /// Intro page
    await tester.pumpAndSettle(const Duration(seconds: 20));
    GeneralFunctions.takeScreenshot('1_intro_page');
    await GeneralFunctions.clickButton(
        tester: tester, text: 'Next', buttonType: TextButton);
    await GeneralFunctions.clickButton(
        tester: tester, text: 'Done', buttonType: TextButton);

    /// Home Page
    GeneralFunctions.takeScreenshot('2_home_page');
    final Finder nextButtonFinder = find.byType(CardAtom).first;
    expect(nextButtonFinder, findsOneWidget);
    await tester.tap(nextButtonFinder);
    await tester.pumpAndSettle();

    /// Light Switch Page
    GeneralFunctions.takeScreenshot('3_light_switch_page');
  });
}
