import 'package:auto_route/auto_route.dart';
import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:flutter/material.dart';

class EmptyOpenAreaOrganism extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            alignment: Alignment.center,
            child: const ImageAtom(
              'assets/cbj_logo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          TextButton(
            onPressed: context.router.maybePop,
            child: TextAtom(
              'No device found',
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
