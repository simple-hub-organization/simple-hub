import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:flutter/material.dart';

class IntroductionScreenBodyWelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Row(
      children: <Widget>[
        TextAtom(
          'We',
          style: textTheme.bodyLarge!.copyWith(color: Colors.white),
        ),
        const SizedBox(width: 10.0),
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'are OPEN SOURCE',
              textStyle: textTheme.titleMedium!.copyWith(color: Colors.white),
            ),
            TypewriterAnimatedText(
              'are FAIR',
              textStyle: textTheme.titleMedium!.copyWith(color: Colors.white),
            ),
            TypewriterAnimatedText(
              'are INNOVATIVE',
              textStyle: textTheme.titleMedium!.copyWith(color: Colors.white),
            ),
            TypewriterAnimatedText(
              'are PRIVATE',
              textStyle: textTheme.titleMedium!.copyWith(color: Colors.white),
            ),
            TypewriterAnimatedText(
              'are SECURE',
              textStyle: textTheme.titleMedium!.copyWith(color: Colors.white),
            ),
            TypewriterAnimatedText(
              'are EASY TO USE',
              textStyle: textTheme.titleMedium!.copyWith(color: Colors.white),
            ),
            TypewriterAnimatedText(
              'support LOCAL CONNECTION',
              textStyle: textTheme.titleMedium!.copyWith(color: Colors.white),
            ),
            TypewriterAnimatedText(
              'want a BETTER FUTURE',
              textStyle: textTheme.titleMedium!.copyWith(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
