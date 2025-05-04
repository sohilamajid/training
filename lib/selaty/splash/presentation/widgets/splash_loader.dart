import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SplashLoader extends StatelessWidget {
  final String imagePath;

  const SplashLoader({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: isPortrait ? 35.r : 30.r,
      child:
      Image.asset(imagePath, height: 60.h, width: 60.w),
    );
  }
}
