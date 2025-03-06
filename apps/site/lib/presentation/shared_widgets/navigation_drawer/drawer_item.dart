import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Draw the items in the drawer
class DrawerItem extends StatelessWidget {
  /// All items must have title and icon to look good
  const DrawerItem(this.title, this.icon);

  /// Text of the item
  final String title;

  /// Icon to show in the item
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Row(
          children: <Widget>[
            FaIcon(icon, color: Theme.of(context).textTheme.bodyLarge!.color),
            const SizedBox(
              width: 30,
            ),
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
