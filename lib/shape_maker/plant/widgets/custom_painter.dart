import 'dart:ui' as ui;
import 'package:flutter/material.dart';
class RPS2CustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0048625, size.height * 0.9994059);
    path_0.cubicTo(
        size.width * 0.3554875,
        size.height * 0.5769802,
        size.width * 0.3105375,
        size.height * -0.0051485,
        size.width * 0.4987500,
        size.height * 0.0099010);
    path_0.cubicTo(
        size.width * 0.7157750,
        size.height * 0.0009406,
        size.width * 0.6854375,
        size.height * 0.6497525,
        size.width * 1.0033125,
        size.height * 1.0024257);
    path_0.cubicTo(
        size.width * 0.7530000,
        size.height * 1.0049010,
        size.width * 0.7558000,
        size.height * 0.9919802,
        size.width * 0.0048625,
        size.height * 0.9994059);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}