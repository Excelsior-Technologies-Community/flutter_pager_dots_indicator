import 'package:flutter/material.dart';

class SlideDotsIndicator extends StatelessWidget {
  final int itemCount;
  final double position;
  final Color activeColor;
  final Color inactiveColor;
  final double dotSize;
  final double spacing;

  const SlideDotsIndicator({
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
    return SizedBox(
      height: dotSize,
      child: Stack(
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
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: position * (dotSize + spacing),
            child: Container(
              width: dotSize,
              height: dotSize,
              decoration: BoxDecoration(
                color: activeColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
