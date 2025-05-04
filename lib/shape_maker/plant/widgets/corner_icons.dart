import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;
import 'custom_painter.dart';
class CornerIcons extends StatelessWidget {
  final IconData? icon ;
  final IconData? icon2 ;
  const CornerIcons({
    super.key, this.icon, this.icon2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 265,
          bottom: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                angle: math.pi / 2, // Rotates counter-clockwise
                child: CustomPaint(
                  size: Size(200.w, (200 * 0.2525).toDouble()),
                  painter: RPS2CustomPainter(),
                ),
              ),
              Icon(icon ?? Icons.person,color: Colors.black,size: 30.r,),
            ],
          ),
        ),
        Positioned(
          left: 265,
          bottom: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                angle: -math.pi / 2, // Rotates counter-clockwise
                child: CustomPaint(
                  size: Size(200.w, (200 * 0.2525).toDouble()),
                  painter: RPS2CustomPainter(),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                  child: Icon(icon2 ?? Icons.home ,color: Colors.black,size: 30.r,)),
            ],
          ),
        ),
      ],
    );
  }
}