import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CartStates extends StatelessWidget {
  const CartStates({
    super.key,
    required this.width,
    required this.height,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.button,
    this.containerColor,
    this.titleColor,
    this.subtitleColor,
    this.imageColor,
    required this.isPortrait,
  });

  final double width;
  final double height;
  final String imagePath;
  final String title;
  final String subtitle;
  final Widget button;
  final Color? containerColor;
  final Color? titleColor;
  final Color? subtitleColor;
  final Color? imageColor;
  final bool isPortrait ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * .90,
      height: height * .70,
      decoration: BoxDecoration(
        color: containerColor ?? Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.0.h),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(imagePath,
                        color: imageColor , width: 170.w, height: 170.h),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: titleColor ?? Colors.white,
                        fontSize: isPortrait ? 21.sp : 15.sp,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: subtitleColor ?? Colors.white,
                        fontSize: isPortrait ? 14.sp : 10.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 135.h,),
              button,
            ],
          ),
        ),
      ),
    );
  }
}