import 'package:flutter/material.dart';
import 'dot_shape.dart';
import 'dot_widget.dart';

class BasicDotsIndicator extends StatelessWidget {
  final int itemCount;
  final double position;
  final Color activeColor;
  final Color inactiveColor;
  final double dotSize;
  final double spacing;
  final DotShape shape;

  const BasicDotsIndicator({
    super.key,
    required this.itemCount,
    required this.position,
    required this.activeColor,
    required this.inactiveColor,
    required this.dotSize,
    required this.spacing,
    required this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(itemCount, (index) {
        final isActive = index == position.round();

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing / 2),
          child: DotWidget(
            shape: shape,
            size: dotSize,
            color: isActive ? activeColor : inactiveColor,
          ),
        );
      }),
    );
  }
}
