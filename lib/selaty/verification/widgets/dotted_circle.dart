import 'dart:ui';
import 'package:flutter/material.dart';

class DottedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white // Border color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    double radius = size.width / 2;
    Path path = Path()..addOval(Rect.fromCircle(center: Offset(radius, radius), radius: radius));

    // Create a dashed path effect
    double dashWidth = 10, dashSpace = 7, distance = 0;
    Path dashedPath = Path();
    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashedPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }
    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}