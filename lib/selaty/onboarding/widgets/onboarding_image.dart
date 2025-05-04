import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../onboarding_screen.dart';
class BuildOnBoardingImage extends StatelessWidget {
  const BuildOnBoardingImage({
    super.key,
    required this.widget,
  });

  final OnBoardingScreen widget;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: widget.lightColor,
      radius: 100.r,
      child: CircleAvatar(
        backgroundColor: widget.mediumColor,
        radius: 80.r,
        child: CircleAvatar(
          backgroundColor: widget.darkColor,
          radius: 60.r,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.asset(
              widget.image,
              width: 60.r,
              height: 60.r,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}