import 'package:flutter/material.dart';

class CardAtom extends StatelessWidget {
  const CardAtom(this.child);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        //set border radius more than 50% of height and width to make circle
      ),
      child: child,
    );
  }
}
