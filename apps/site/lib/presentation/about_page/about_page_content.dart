import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:site/presentation/about_page/about_page_content_desktop.dart';
import 'package:site/presentation/about_page/about_page_content_mobile_tablet.dart';

/// About page content
class AboutPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => AboutPageContentMobileTablet(),
      desktop: (context) => AboutPageContentDesktop(),
    );
  }
}
