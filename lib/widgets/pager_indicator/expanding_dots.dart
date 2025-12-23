import 'package:flutter/material.dart';

class ExpandingDotsIndicator extends StatelessWidget {
  final int itemCount;
  final double position;
  final Color activeColor;
  final Color inactiveColor;
  final double dotSize;
  final double spacing;

  const ExpandingDotsIndicator({
    super.key,
    required this.itemCount,
    required this.position,
    required this.activeColor,
    required this.inactiveColor,
    required this.dotSize,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(itemCount, (index) {
        final selectedness =
        (1.0 - (position - index).abs()).clamp(0.0, 1.0);
        final width = dotSize + (dotSize * selectedness);

        return Container(
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          width: width,
          height: dotSize,
          decoration: BoxDecoration(
            color: Color.lerp(inactiveColor, activeColor, selectedness),
            borderRadius: BorderRadius.circular(dotSize),
          ),
        );
      }),
    );
  }
}
