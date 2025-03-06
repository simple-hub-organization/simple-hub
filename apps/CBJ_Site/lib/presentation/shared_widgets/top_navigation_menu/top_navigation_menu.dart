import 'package:cybear_jinni_site/presentation/new_home_page/widgets/new_nav_bar.dart';
import 'package:cybear_jinni_site/presentation/shared_widgets/top_navigation_menu/top_navigation_menu_mobile_tablet.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
