import 'package:flutter/material.dart';
class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.0001375,size.height*0.0040667);
    path_0.cubicTo(size.width*0.1892750,size.height*0.3736000,size.width*0.0614000,size.height*0.8690000,size.width*0.0043125,size.height*1.0129667);
    path_0.cubicTo(size.width*0.4971000,size.height*0.7022000,size.width*0.5138250,size.height*0.7005000,size.width*0.9998625,size.height*1.0037667);
    path_0.cubicTo(size.width*0.9806375,size.height*0.9047667,size.width*0.8264750,size.height*0.3686333,size.width*0.9986125,size.height*-0.0033333);
    path_0.cubicTo(size.width*0.5398500,size.height*0.2625333,size.width*0.4811500,size.height*0.2714000,size.width*0.0001375,size.height*0.0040667);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}