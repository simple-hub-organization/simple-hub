import 'package:flutter/material.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';

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
