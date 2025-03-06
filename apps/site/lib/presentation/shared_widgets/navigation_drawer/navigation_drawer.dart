import 'package:site/presentation/route_names.dart';
import 'package:site/presentation/shared_widgets/navigation_drawer/drawer_item_on_click_route_page.dart';
import 'package:site/presentation/shared_widgets/navigation_drawer/navigation_drawer_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Navigation drawer for small screen sizes, replace the top navigation menu
class NavigationDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
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
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          NavigationDrawerHeader(),
          const DrawerItemOnClickRoutePage(
            'Home',
            FontAwesomeIcons.house,
            homeRoute,
          ),
          const SizedBox(
            height: 13,
          ),
          const DrawerItemOnClickRoutePage(
            'Integrations',
            FontAwesomeIcons.lightbulb,
            integrationsRoute,
          ),
          const SizedBox(
            height: 13,
          ),
          const DrawerItemOnClickRoutePage(
            'Set Up',
            FontAwesomeIcons.shapes,
            setUpRoute,
          ),
          const SizedBox(
            height: 13,
          ),
          const DrawerItemOnClickRoutePage(
            'FAQ',
            FontAwesomeIcons.circleQuestion,
            faqRoute,
          ),
          const SizedBox(
            height: 13,
          ),
          const DrawerItemOnClickRoutePage(
            'About',
            FontAwesomeIcons.addressCard,
            aboutRoute,
          ),
          const SizedBox(
            height: 13,
          ),
        ],
      ),
    );
  }
}
