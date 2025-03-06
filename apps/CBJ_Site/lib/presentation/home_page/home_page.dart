import 'package:cybear_jinni_site/presentation/home_page/home_page_content.dart';
import 'package:cybear_jinni_site/presentation/shared_widgets/navigation_drawer/navigation_drawer.dart';
import 'package:cybear_jinni_site/presentation/shared_widgets/top_navigation_menu/top_navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Home and lending page of the site
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: const <double>[0, 0, 0, 1],
          colors: <Color>[
            Theme.of(context).primaryColor,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).primaryColor
          ],
        ),
      ),
      child: ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) =>
            SelectionArea(
          child: Scaffold(
            drawer:
                sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
                        sizingInformation.deviceScreenType ==
                            DeviceScreenType.tablet
                    ? NavigationDrawerWidget()
                    : null,
            backgroundColor: Colors.transparent,
            body: Stack(
              children: <Widget>[
                HomePageContent(),
                TopNavigationMenu(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CrosRightSizde extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width / 1.2, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CrosRightSizde oldClipper) => false;
}

class CrosLeftSizde extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width / 15, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CrosLeftSizde oldClipper) => false;
}
