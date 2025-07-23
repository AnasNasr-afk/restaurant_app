import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../themes/color_manager.dart';

void showAppLoadingDialog(
    BuildContext context, {
      Color color = ColorManager.darkRedColor,
      double? size,
    }) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Center(
      child: LoadingAnimationWidget.inkDrop(
        color: color,
        size: size ?? 55,
      ),
    ),
  );
}