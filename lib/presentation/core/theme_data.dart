import 'package:flutter/material.dart';

///List of all the GradientColors to iterate on
final Set<List<Color>> gradientColorsList = {
  GradientColors.sky,
  GradientColors.fire,
  GradientColors.new1,
  GradientColors.sunset,
  GradientColors.sea,
  GradientColors.mango,
};

class GradientColors {
  static List<Color> sky = [
    const Color(0xFF6448FE),
    const Color(0xFF5FC6FF),
  ];
  static List<Color> sunset = [
    const Color(0xFFFE6197),
    const Color(0xFFFFB463),
  ];
  static List<Color> sea = [
    const Color(0xFF61A3FE),
    const Color(0xFF63FFD5),
  ];
  static List<Color> mango = [
    const Color(0xFFFFA738),
    const Color(0xFFFFE130),
  ];
  static List<Color> fire = [
    const Color(0xFFFF5DCD),
    const Color(0xFFFF8484),
  ];
  static List<Color> new1 = [
    const Color(0xFF5873EF),
    const Color(0xFFB29CFF),
  ];
}

class AppThemeData {
  static const double generalSpacing = 20;

  static EdgeInsets generalHorizontalEdgeInsets =
      const EdgeInsets.symmetric(horizontal: generalSpacing);
}

class ListOfColors {
  ListOfColors(this.listOfColors);

  Set<Color>? listOfColors;
}

class BackgroundGradient {
  static LinearGradient getBackground(BuildContext context) {
    return LinearGradient(
      /// Where the linear gradient begins and ends
      begin: Alignment.topRight,
      end: Alignment.bottomCenter,

      /// Add one stop for each color. Stops should increase from 0 to 1
      stops: const <double>[0, 0.2, 0.5, 0.6, 1],
      colors: <Color>[
        Colors.deepPurple,
        Theme.of(context).colorScheme.secondary,
        Colors.deepPurple.withAlpha((0.9 * 255).toInt()),
        Theme.of(context).colorScheme.secondary.withAlpha((0.9 * 255).toInt()),
        Colors.deepPurple,
      ],
    );
  }
}
