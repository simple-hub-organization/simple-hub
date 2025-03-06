import 'package:flutter/material.dart';

class IconAtom extends StatelessWidget {
  const IconAtom(this.icon);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon);
  }
}
