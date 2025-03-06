import 'dart:io';

import 'package:cybearjinni/presentation/atoms/button_atom.dart';
import 'package:cybearjinni/presentation/atoms/separator_atom.dart';
import 'package:flutter/material.dart';

void permsissionsDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const PermsissionsDialogMolecule(),
    );

class PermsissionsDialogMolecule extends StatelessWidget {
  const PermsissionsDialogMolecule({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return AlertDialog(
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '1. Make sure you are connected to home WiFi\n'
              '2. Please make sure location is on and permission grented.',
              style: textTheme.labelLarge,
              textAlign: TextAlign.center,
              // ).tr(),
            ),
            const SeparatorAtom(),
            ButtonWidgetAtom(
              variant: ButtonVariant.primary,
              onPressed: () async {
                exit(0);
              },
              text: 'exit',
            ),
          ],
        ),
      ),
    );
  }
}
