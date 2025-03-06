import 'package:flutter/material.dart';

class TextAtom extends StatelessWidget {
  const TextAtom(
    this.text, {
    super.key,
    this.style = const TextStyle(),
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.translationArgs,
    this.translate = true,
    this.veriant = TextVeriant.regular,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final List<String>? translationArgs;
  final bool translate;
  final TextVeriant veriant;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    TextStyle? tempStyle = style;

    switch (veriant) {
      case TextVeriant.regular:
        break;
      case TextVeriant.smallTitle:
        tempStyle = textTheme.titleLarge;
      case TextVeriant.medium:
        tempStyle = textTheme.bodyMedium;
    }

    return Text(
      // translate && text.isNotEmpty ? text.tr(args: translationArgs) : text,
      text,
      style: tempStyle,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}

enum TextVeriant {
  smallTitle,

  /// define out side, trying to deprecate
  regular,
  medium,
  ;
}
