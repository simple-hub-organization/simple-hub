import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BorderTextWithShadow extends StatelessWidget {
  const BorderTextWithShadow(
    this._text, {
    this.fontSize = 22,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
  });

  final String _text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          _text,
          style: TextStyle(
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1
              ..color = HexColor('#6C6C6C'),
            shadows: <Shadow>[
              Shadow(
                offset: const Offset(0, 2),
                blurRadius: 2.0,
                color: HexColor('#6C6C6C'),
              ),
            ],
            fontWeight: fontWeight,
          ),
          textAlign: textAlign,
        ),
        // Solid text as fill.
        Text(
          _text,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.white,
            fontWeight: fontWeight,
          ),
          textAlign: textAlign,
        ),
      ],
    );
  }
}
