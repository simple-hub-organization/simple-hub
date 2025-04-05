import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';

class DeviceNameRowMolecule extends StatelessWidget {
  const DeviceNameRowMolecule(this.name, this.second);
  final String name;
  final Widget second;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextAtom(
            name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        second,
      ],
    );
  }
}
