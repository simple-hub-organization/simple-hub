import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:site/presentation/faq_page/faq_page_content_desktop.dart';
import 'package:site/presentation/faq_page/faq_page_content_mobile_tablet.dart';

/// Faq page content
class FaqPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => FaqPageContentMobileTablet(),
      tablet: (context) => FaqPageContentMobileTablet(),
      desktop: (context) => FaqPageContentDesktop(),
    );
  }
}
