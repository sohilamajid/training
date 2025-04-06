import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashLogo extends StatelessWidget {
  final String imagePath;

  const SplashLogo({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 150.w,
      child: Image.asset(imagePath),
    );
  }
}
