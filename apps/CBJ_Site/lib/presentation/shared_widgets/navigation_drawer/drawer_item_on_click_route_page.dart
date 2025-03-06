import 'package:cybear_jinni_site/presentation/shared_widgets/navigation_drawer/drawer_item.dart';
import 'package:flutter/material.dart';

/// Adding on click and dark background functionality to DrawerItem
class DrawerItemOnClickRoutePage extends StatelessWidget {
  /// Setting the text, icon, page to move on click
  const DrawerItemOnClickRoutePage(this.title, this.icon, this.onClickRoute);

  /// The text in the card
  final String title;

  /// The icon to show
  final IconData icon;

  /// What page to move to if clicked
  final String onClickRoute;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.black38,
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.zero,
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(
          context,
          onClickRoute,
        );
      },
      child: DrawerItem(title, icon),
    );
  }
}
