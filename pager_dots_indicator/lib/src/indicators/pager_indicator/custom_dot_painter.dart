import 'dart:math';
import 'package:flutter/material.dart';
import 'dot_shape.dart';

class CustomDotPainter extends CustomPainter {
  final DotShape shape;
  final Color color;

  CustomDotPainter({
    required this.shape,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    switch (shape) {
      case DotShape.triangle:
        final path = Path()
          ..moveTo(center.dx, 0)
          ..lineTo(size.width, size.height)
          ..lineTo(0, size.height)
          ..close();
        canvas.drawPath(path, paint);
        break;

      case DotShape.star:
        final path = Path();
        const points = 5;
        final outerRadius = size.width / 2;
        final innerRadius = outerRadius / 2.5;

        for (int i = 0; i < points * 2; i++) {
          final angle = (pi / points) * i;
          final radius = i.isEven ? outerRadius : innerRadius;
          final x = center.dx + radius * cos(angle);
          final y = center.dy + radius * sin(angle);

          if (i == 0) {
            path.moveTo(x, y);
          } else {
            path.lineTo(x, y);
          }
        }
        path.close();
        canvas.drawPath(path, paint);
        break;

      case DotShape.linear:
        final rect = Rect.fromLTWH(
          0,
          size.height / 2 - size.height / 6,
          size.width,
          size.height / 3,
        );
        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(size.height)),
          paint,
        );
        break;

      default:
        canvas.drawCircle(center, size.width / 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
