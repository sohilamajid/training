import 'package:flutter/material.dart';

import '../../../const.dart';
class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = AppColors.lightGreenColor
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.0045250,size.height*1.0015333);
    path_0.cubicTo(size.width*0.6532500,size.height*0.6773000,size.width*0.3107250,size.height*0.0072000,size.width*0.5076500,size.height*0.0070333);
    path_0.cubicTo(size.width*0.7146625,size.height*-0.0008667,size.width*0.3845000,size.height*0.6508333,size.width*0.9974750,size.height*0.9900333);
    path_0.cubicTo(size.width*0.5945750,size.height*0.9923333,size.width*0.3523500,size.height*0.9975667,size.width*0.0045250,size.height*1.0015333);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
