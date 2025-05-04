import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomShape extends StatelessWidget {
  const BottomShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 120,
      bottom: 0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(
                130.w,
                (130 * 0.25)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(),
          ),
          Icon(CupertinoIcons.bag_fill,color: Colors.black,size: 25.r,),
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color(0xFF8ed486)
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
