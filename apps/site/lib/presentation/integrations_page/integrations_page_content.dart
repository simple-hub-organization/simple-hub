import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:site/presentation/integrations_page/integrations_page_content_desktop.dart';
import 'package:site/presentation/integrations_page/integrations_page_content_mobile_tablet.dart';

/// Integrations page content
class IntegrationsPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => IntegrationsPageContentMobileTablet(),
      tablet: (context) => IntegrationsPageContentMobileTablet(),
      desktop: (context) => IntegrationsPageContentDesktop(),
    );
  }
}
