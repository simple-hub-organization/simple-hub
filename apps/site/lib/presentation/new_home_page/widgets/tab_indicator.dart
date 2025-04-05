import 'package:flutter/material.dart';

class TabIndicator extends StatelessWidget {
  const TabIndicator(this.numberOfTabs, this.currentTab);

  final int numberOfTabs;
  final int currentTab;

  @override
  Widget build(BuildContext context) {
    const double circleSize = 20;
    const double margin = 6;
    return SizedBox(
      width: 50,
      height: circleSize * numberOfTabs + circleSize * 2,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          double size = 4;
          if (index == currentTab) {
            size += 8;
          }
          return Container(
            margin: const EdgeInsets.all(margin),
            child: CirclePainterUnTicked(size),
          );
        },
        itemCount: numberOfTabs,
      ),
    );
  }
}

class CirclePainterUnTicked extends StatelessWidget {
  const CirclePainterUnTicked(this.size);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
