import 'package:site/presentation/set_up_page/set_up_page_content_desktop.dart';
import 'package:site/presentation/set_up_page/set_up_page_content_mobile_tablet.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Set Up page content
class SetUpPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => SetUpPageContentMobileTablet(),
      tablet: (context) => SetUpPageContentMobileTablet(),
      desktop: (context) => SetUpPageContentDesktop(),
    );
  }
}
