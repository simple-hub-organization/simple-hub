import 'package:site/presentation/shared_widgets/navigation_drawer/drawer_item.dart';
import 'package:flutter/material.dart';

/// Adding on click start function to DrawerItem
class DrawerItemOnClickStartFunction extends StatelessWidget {
  /// Setting the text, icon, function to start on click
  const DrawerItemOnClickStartFunction(
    this.title,
    this.icon,
    this.onClickFunction,
  );

  /// The text in the card
  final String title;

  /// The icon to show
  final IconData icon;

  /// What function to run if clicked
  final Function onClickFunction;

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
        onClickFunction(context);
      },
      child: DrawerItem(title, icon),
    );
  }
}
