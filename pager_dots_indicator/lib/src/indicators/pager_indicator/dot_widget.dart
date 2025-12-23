import 'package:flutter/material.dart';
import 'dot_shape.dart';
import 'custom_dot_painter.dart';

class DotWidget extends StatelessWidget {
  final DotShape shape;
  final Color color;
  final double size;

  const DotWidget({
    super.key,
    required this.shape,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    switch (shape) {
      case DotShape.circle:
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        );

      case DotShape.square:
        return Container(width: size, height: size, color: color);

      case DotShape.roundedSquare:
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
        );

      case DotShape.pill:
        return Container(
          width: size * 1.6,
          height: size,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(size),
          ),
        );

      case DotShape.diamond:
        return Transform.rotate(
          angle: 0.785398, // 45°
          child: Container(width: size, height: size, color: color),
        );

      default:
        return CustomPaint(
          size: Size(size, size),
          painter: CustomDotPainter(
            shape: shape,
            color: color,
          ),
        );
    }
  }
}
