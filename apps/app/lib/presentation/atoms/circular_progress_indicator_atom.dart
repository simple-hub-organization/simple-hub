import 'package:flutter/material.dart';

class CircularProgressIndicatorAtom extends StatelessWidget {
  const CircularProgressIndicatorAtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }
}
