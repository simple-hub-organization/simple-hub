import 'package:cybearjinni/presentation/core/theme_data.dart';
import 'package:flutter/cupertino.dart';

class SeparatorAtom extends StatelessWidget {
  const SeparatorAtom({this.variant = SeparatorVariant.generalSpacing});

  final SeparatorVariant variant;

  @override
  Widget build(BuildContext context) {
    double spacing;
    switch (variant) {
      case SeparatorVariant.reletedElements:
        spacing = 10;
      case SeparatorVariant.closeWidgets:
      case SeparatorVariant.generalSpacing:
        spacing = AppThemeData.generalSpacing;
      case SeparatorVariant.farAppart:
        spacing = 40;
    }
    return SizedBox(
      height: spacing,
      width: spacing,
    );
  }
}

enum SeparatorVariant {
  reletedElements,
  closeWidgets,
  generalSpacing,
  farAppart,
  ;
}
