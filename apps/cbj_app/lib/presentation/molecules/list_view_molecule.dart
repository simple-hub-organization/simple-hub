import 'package:cybearjinni/presentation/atoms/atoms.dart';
import 'package:flutter/cupertino.dart';

class ListViewMolecule extends StatelessWidget {
  const ListViewMolecule(
    this.veriant, {
    required this.itemCount,
    required this.itemBuilder,
    super.key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.physics,
    this.shrinkWrap = false,
    this.separatorVariant = SeparatorVariant.reletedElements,
  });

  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final ListViewVeriant veriant;
  final SeparatorVariant separatorVariant;

  @override
  Widget build(BuildContext context) {
    switch (veriant) {
      case ListViewVeriant.builder:
        return ListView.builder(
          shrinkWrap: shrinkWrap,
          physics: physics,
          itemCount: itemCount,
          scrollDirection: scrollDirection,
          reverse: reverse,
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) =>
              itemBuilder(context, index),
        );
      case ListViewVeriant.separated:
        return ListView.separated(
          shrinkWrap: shrinkWrap,
          physics: physics,
          itemCount: itemCount,
          scrollDirection: scrollDirection,
          reverse: reverse,
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) =>
              itemBuilder(context, index),
          separatorBuilder: (context, index) =>
              SeparatorAtom(variant: separatorVariant),
        );
    }
  }
}

enum ListViewVeriant {
  builder,
  separated,
  ;
}
