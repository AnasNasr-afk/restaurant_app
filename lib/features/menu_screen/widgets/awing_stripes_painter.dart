import 'package:flutter/material.dart';

class AwningDecoration extends StatelessWidget {
  final double height;
  final Color backgroundColor;

  const AwningDecoration({
    super.key,
    this.height = 120,
    this.backgroundColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: RestaurantAwningClipper(),
      child: CustomPaint(
        painter: AwningStripesPainter(),
        child: Container(
          height: height,
          color: backgroundColor,
        ),
      ),
    );
  }
}

class RestaurantAwningClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height - 60);

    int scallopCount = 6;
    double scallopWidth = size.width / scallopCount;
    double curveDepth = 30;

    for (int i = 0; i < scallopCount; i++) {
      final xStart = i * scallopWidth;
      final xMid = xStart + scallopWidth / 2;
      final xEnd = xStart + scallopWidth;

      path.quadraticBezierTo(
        xMid,
        size.height - 60 + curveDepth,
        xEnd,
        size.height - 60,
      );
    }

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class AwningStripesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.1)
      ..strokeWidth = 2;

    for (int i = 0; i < 20; i++) {
      final x = i * 25.0;
      canvas.drawLine(
        Offset(x, 0),
        Offset(x - 50, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
