import 'package:flutter/material.dart';
import 'package:selaty/const.dart';

class RPS3CustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = AppColors.lightGreenColor
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0006875, size.height * 0.8326667);
    path_0.cubicTo(
        size.width * -0.0012750,
        size.height * 0.1991333,
        size.width * 0.1544750,
        size.height * 0.0184000,
        size.width * 0.2487500,
        0);
    path_0.cubicTo(
        size.width * 0.4688375,
        size.height * 0.1009000,
        size.width * 0.5377375,
        size.height * 0.0919667,
        size.width * 0.7512500,
        0);
    path_0.cubicTo(
        size.width * 0.8059875,
        size.height * 0.0116000,
        size.width * 0.9876750,
        size.height * 0.1497667,
        size.width * 0.9880125,
        size.height * 0.8316667);
    path_0.cubicTo(
        size.width * 0.9857625,
        size.height * 1.2057000,
        size.width * 0.6115000,
        size.height * 0.8686333,
        size.width * 0.4974625,
        size.height * 0.8406333);
    path_0.cubicTo(
        size.width * 0.3076000,
        size.height * 0.8757000,
        size.width * 0.0068625,
        size.height * 1.1958333,
        size.width * 0.0006875,
        size.height * 0.8326667);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}