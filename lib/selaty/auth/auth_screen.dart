import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../login/login_screen.dart';
import '../sign_up/sign_up_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String backImage = "assets/images/logo.png";

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              bool isPortrait = orientation == Orientation.portrait;
              return Stack(
                children: [
                  _buildBackGround(isPortrait,backImage),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: isPortrait ? 150.0 : 25),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight, // Ensures full height
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Container(
                                      height: 120.h,
                                      width: 120.w,
                                      child: Image.asset(backImage),
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      _buildText(text: "ســـــلتي", color: Color(0xFFd6262b)),
                                      _buildText(text: "S E L A T Y", color: Colors.black),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 50.h),
                              _button(
                                text: "تسجيل الدخول",
                                color: Color(0xFFef3f4c),
                                width: constraints.maxWidth,
                                onTap: () {
                                  Get.to(
                                    LoginScreen(),
                                    curve: Curves.bounceInOut,
                                    duration: Duration(seconds: 1),
                                  );
                                },
                              ),
                              SizedBox(height: 20),
                              _button(
                                text: "انشئ حساب",
                                color: Color(0xFF2ac17e),
                                width: constraints.maxWidth,
                                onTap: () {
                                  Get.to(SignUpScreen());
                                },
                              ),
                              Spacer(), // Push content to fill available space
                            ],
                          ),
                        ),
                      ),
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






  Widget _button({
    required String text,
    required Color color,
    required double width,
    void Function()? onTap
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: width * .9,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),)),
      ),
    );
  }

  Widget _buildText({
    required String text,
    required  Color? color,
  }) {
    return Text(text,style: TextStyle(
        fontSize: 30.sp,
        color: color,
        fontWeight: FontWeight.bold
      // fontFamily: ArabicFont,
    ),
    );
  }
  
  Widget _buildBackGround(bool isPortrait, String logo) {
    return Positioned(
      bottom: -100.h,
      right: isPortrait ? -60.w : -90.w,
      child: Opacity(
        opacity: 0.08,
        child: Image.asset(
          logo,
          height: 300.h,
          width: 300.w,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

}

