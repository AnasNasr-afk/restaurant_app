import 'package:flutter/material.dart';

import '../../../core/themes/color_manager.dart';
import 'awing_stripes_painter.dart';
import 'header_content.dart';

class RestaurantHeader extends StatelessWidget {
  const RestaurantHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: RestaurantAwningClipper(),
          child: Container(
            height: 280,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [ColorManager.darkRedColor, ColorManager.brownColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
          ),
        ),
        ClipPath(
          clipper: RestaurantAwningClipper(),
          child: SizedBox(
            height: 280,
            width: double.infinity,
            child: CustomPaint(painter: AwningStripesPainter()),
          ),
        ),
        Positioned(left: 30, top: 233, child: supportPole()),
        Positioned(right: 30, top: 233, child: supportPole()),
        const Positioned.fill(child: HeaderContent()),
      ],
    );
  }
}

Widget supportPole() {
  return Container(
    width: 4,
    height: 50,
    decoration: BoxDecoration(
      color: ColorManager.brownColor,
      borderRadius: BorderRadius.circular(2),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.3),
          blurRadius: 4,
          offset: const Offset(2, 0),
        ),
      ],
    ),
  );
}
