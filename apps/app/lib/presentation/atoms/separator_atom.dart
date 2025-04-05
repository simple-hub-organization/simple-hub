import 'package:flutter/cupertino.dart';
import 'package:simple_hub/presentation/core/theme_data.dart';

class SeparatorAtom extends StatelessWidget {
  const SeparatorAtom({this.variant = SeparatorVariant.generalSpacing});

  final SeparatorVariant variant;

  @override
  Widget build(BuildContext context) {
    double spacing;
    switch (variant) {
      case SeparatorVariant.extensionOfElement:
        spacing = 2;
      case SeparatorVariant.relatedElements:
        spacing = 5;
      case SeparatorVariant.closeWidgets:
        spacing = 10;
      case SeparatorVariant.generalSpacing:
        spacing = AppThemeData.generalSpacing;
      case SeparatorVariant.farApart:
        spacing = 45;
    }
    return SizedBox(
      height: spacing,
      width: spacing,
    );
  }
}

enum SeparatorVariant {
  extensionOfElement,
  relatedElements,
  closeWidgets,
  generalSpacing,
  farApart,
  ;
}
