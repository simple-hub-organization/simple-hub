import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:flutter/material.dart';

class IntroductionScreenBodyAboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    return Column(
      children: [
        const SeparatorAtom(),
        Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            border: Border.all(
              color: Theme.of(context).textTheme.bodyLarge!.color!,
            ),
            // Make rounded corners
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: TextAtom(
                'You are now starting a journey into the world of CyBear'
                ' Jinni.\n\nWe are trying to build an ecosystem of smart'
                ' home that is built upon openness and trust.\n\n'
                'Our products are open source to show you that we'
                ' protect your privacy by default.\n\n'
                'The functionality of the devices will support local'
                ' WiFi execution whenever possible, this way you will'
                ' be able to control your smart home reliably even if you are'
                ' disconnected from the world or the vendor decided to'
                ' drop support.\n\n'
                'For controlling out side of the home WiFi you will need a CBJ Hub which grants'
                ' a lot of extra functionality (very recommended).\n'
                'You can create a Hub by following the simple documentation from the site.\n\n'
                "Thanks for joining and let's continue to make the future better for everyone by choosing open-source technology.",
                style:
                    textTheme.bodyLarge!.copyWith(color: colorScheme.onSurface),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
