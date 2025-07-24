import 'package:flutter/material.dart';

import '../../../core/themes/color_manager.dart';

class StarRating extends StatelessWidget {
  final int rating;
  final int maxRating;
  final double starSize;
  final Color? activeColor;
  final Color? inactiveColor;

  const StarRating({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.starSize = 16,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(maxRating, (i) => Icon(
        Icons.star,
        size: starSize,
        color: i < rating
            ? (activeColor ?? ColorManager.secondaryColor)
            : (inactiveColor ?? Colors.grey[400]),
      )),
    );
  }
}