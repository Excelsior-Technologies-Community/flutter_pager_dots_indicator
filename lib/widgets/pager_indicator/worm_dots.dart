import 'package:flutter/material.dart';

class WormDotsIndicator extends StatelessWidget {
  final int itemCount;
  final double position;
  final Color activeColor;
  final Color inactiveColor;
  final double dotSize;
  final double spacing;

  const WormDotsIndicator({
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
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(itemCount, (_) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: spacing / 2),
              width: dotSize,
              height: dotSize,
              decoration: BoxDecoration(
                color: inactiveColor,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
        Positioned(
          left: position * (dotSize + spacing),
          child: Container(
            width: dotSize * 2,
            height: dotSize,
            decoration: BoxDecoration(
              color: activeColor,
              borderRadius: BorderRadius.circular(dotSize),
            ),
          ),
        ),
      ],
    );
  }
}
