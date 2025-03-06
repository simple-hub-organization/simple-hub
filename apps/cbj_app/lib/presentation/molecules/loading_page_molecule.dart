import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:flutter/material.dart';

class LoadingPageMolecule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: const CircularProgressIndicatorAtom(),
    );
  }
}
