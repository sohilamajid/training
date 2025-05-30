import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/onboarding_image.dart';

class OnBoardingScreen extends StatefulWidget {
  final String image, title, description;
  final Color? lightColor, mediumColor, darkColor;

  const OnBoardingScreen({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.lightColor,
    required this.mediumColor,
    required this.darkColor,
  });

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            bool isPortrait = orientation == Orientation.portrait;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Flex(
                direction: isPortrait ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image Section
                  Align(
                      alignment: Alignment.center,
                      child: BuildOnBoardingImage(widget: widget)
                  ),
                  SizedBox(
                      width: isPortrait ? 0 : 20.w,
                      height: isPortrait ? 50.h : 0),
                  // Text Section
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: isPortrait ? 27.sp : 16.sp,
                            color: widget.darkColor,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                          // textDirection: TextDirection.rtl,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          widget.description,
                          textAlign: TextAlign.start,
                          // textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: isPortrait ? 17.sp : 12.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
