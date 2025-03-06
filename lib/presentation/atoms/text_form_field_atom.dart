import 'package:flutter/material.dart';

class TextFormFieldAtom extends StatelessWidget {
  const TextFormFieldAtom({
    required this.onChanged,
    this.labelText,
    this.prefixIcon,
  });

  final Function(String) onChanged;
  final String? labelText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        // labelText: labelText?.tr(),
        labelText: labelText,
      ),
      autocorrect: false,
      onChanged: onChanged,
    );
  }
}
