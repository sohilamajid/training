import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../onboarding/page_view_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4)).then((value) =>
    Get.offAll(() => PageViewScreen()),);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String logo = "assets/images/logo.png";
    String? loading = "assets/images/loading.gif";

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              bool isPortrait = orientation == Orientation.portrait;

              return Stack(
                fit: StackFit.expand,
                children: [
                  _buildBackGround(isPortrait, logo),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                    child: Flex(
                      direction: isPortrait ? Axis.vertical : Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 150.h,
                          width: 150.w,
                          child: Image.asset(logo),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: isPortrait ? 0 : 20.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: isPortrait
                                ? CrossAxisAlignment.center
                                : CrossAxisAlignment.start,
                            children: [
                              _buildText(
                                  text: "ســـــلتي",
                                  color: Color(0xFFd6262b),
                                  fontSize: isPortrait ? 30.sp : 28.sp),
                              _buildText(
                                  text: "S E L A T Y",
                                  color: Colors.black,
                                  fontSize: isPortrait ? 26.sp : 24.sp),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: isPortrait ? 40.h : 0,
                            width: isPortrait ? 0 : 20.w),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: isPortrait ? 35.r : 30.r,
                          child:
                              Image.asset(loading, height: 60.h, width: 60.w),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildBackGround(bool isPortrait, String logo) {
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

  Widget _buildText({
    required String text,
    required Color? color,
    required double fontSize
  }) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize, color: color, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
