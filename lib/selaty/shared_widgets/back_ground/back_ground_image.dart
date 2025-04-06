import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildBackGround extends StatelessWidget {
  const BuildBackGround({
    super.key,
    required this.isPortrait,
    required this.logo,
  });

  final bool isPortrait;
  final String logo;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: isPortrait ? -100.h : -70.h,
      right: isPortrait ? -60.w : -70.w,
      child: Opacity(
        opacity: 0.08,
        child: Image.asset(
          logo,
          height: isPortrait ? 300.h : 220.h,
          width: isPortrait ? 300.w : 220.w,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}