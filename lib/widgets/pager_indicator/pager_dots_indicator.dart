import 'package:flutter/material.dart';
import 'package:flutter_pager_dots_indicator/widgets/pager_indicator/basic_dots.dart';
import 'package:flutter_pager_dots_indicator/widgets/pager_indicator/dot_shape.dart';
import 'package:flutter_pager_dots_indicator/widgets/pager_indicator/expanding_dots.dart';
import 'package:flutter_pager_dots_indicator/widgets/pager_indicator/indicator_type.dart';
import 'package:flutter_pager_dots_indicator/widgets/pager_indicator/worm_dots.dart';

class PagerDotsIndicator extends StatelessWidget {
  final int itemCount;
  final double position;
  final PagerIndicatorType type;
  final Color activeColor;
  final Color inactiveColor;
  final double dotSize;
  final double spacing;
  final DotShape dotShape;

  /// 🔥 NEW
  final ValueChanged<int>? onDotClicked;

  const PagerDotsIndicator({
    super.key,
    required this.itemCount,
    required this.position,
    this.type = PagerIndicatorType.basic,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.dotSize = 8,
    this.spacing = 8,
    this.onDotClicked,
    this.dotShape = DotShape.circle, // 👈
  });

  @override
  Widget build(BuildContext context) {
    Widget indicator;

    switch (type) {
      case PagerIndicatorType.worm:
        indicator = WormDotsIndicator(
          itemCount: itemCount,
          position: position,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          dotSize: dotSize,
          spacing: spacing,
        );
        break;

      case PagerIndicatorType.expanding:
        indicator = ExpandingDotsIndicator(
          itemCount: itemCount,
          position: position,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          dotSize: dotSize,
          spacing: spacing,
        );
        break;

      default:
        indicator = BasicDotsIndicator(
          itemCount: itemCount,
          position: position,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          dotSize: dotSize,
          spacing: spacing,
          shape: dotShape,
        );
    }

    /// 🔥 Click wrapper
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: (details) {
        if (onDotClicked == null) return;

        final totalWidth =
            itemCount * dotSize + (itemCount - 1) * spacing;
        final tapX = details.localPosition.dx;
        final index =
        (tapX / totalWidth * itemCount).floor().clamp(0, itemCount - 1);

        onDotClicked!(index);
      },
      child: indicator,
    );
  }
}
