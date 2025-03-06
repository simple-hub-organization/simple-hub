import 'package:cybearjinni/presentation/core/theme_data.dart';
import 'package:flutter/widgets.dart';

class MarginedExpandedAtom extends StatelessWidget {
  const MarginedExpandedAtom({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        margin: AppThemeData.generalHorizontalEdgeInsets,
        child: child,
      ),
    );
  }
}
