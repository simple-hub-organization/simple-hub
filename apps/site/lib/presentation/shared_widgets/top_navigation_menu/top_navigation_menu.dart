import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:site/presentation/new_home_page/widgets/new_nav_bar.dart';
import 'package:site/presentation/shared_widgets/top_navigation_menu/top_navigation_menu_mobile_tablet.dart';

/// Top navigation menu for the site
class TopNavigationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => TopNavigationMenuMobileTablet(),
      desktop: (context) => NewNavBar(),
    );
  }
}
