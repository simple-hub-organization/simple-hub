import 'package:site/presentation/shared_widgets/bottom_navigation_menu/bottom_navigation_menu_desktop.dart';
import 'package:site/presentation/shared_widgets/bottom_navigation_menu/bottom_navigation_menu_mobile_tablet.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Bottom navigation menu for the site
class BottomNavigationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => BottomNavigationMenuMobileTablet(),
      desktop: (context) => BottomNavigationMenuDesktop(),
    );
  }
}
