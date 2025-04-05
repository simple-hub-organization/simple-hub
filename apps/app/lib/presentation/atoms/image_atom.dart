import 'package:flutter/cupertino.dart';

class ImageAtom extends StatelessWidget {
  const ImageAtom(
    this.name, {
    this.fit,
    this.width,
    this.height,
    this.hero,
  });

  final String name;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final String? hero;

  Widget image() {
    return Image.asset(
      name,
      fit: fit,
      width: width,
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (hero != null) {
      return Hero(
        tag: hero!,
        child: image(),
      );
    }
    return image();
  }
}
