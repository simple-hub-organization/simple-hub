import 'package:flutter/material.dart';

class BottomNavigationBarItemAtom extends BottomNavigationBarItem {
  const BottomNavigationBarItemAtom({
    required super.icon,
    super.activeIcon,
    super.label,
  });

  BottomNavigationBarItem getBar() {
    return BottomNavigationBarItem(
      icon: icon,
      activeIcon: activeIcon,
      label: label,
    );
  }
}
