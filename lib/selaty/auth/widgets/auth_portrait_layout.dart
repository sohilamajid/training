import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const.dart';
import '../../login/login_screen.dart';
import '../../shared_widgets/back_ground/back_ground_image.dart';
import '../../shared_widgets/custom_button/custom_button.dart';
import '../../shared_widgets/custom_title_image/title_image.dart';
import '../../sign_up/sign_up_screen.dart';

class AuthPortraitLayout extends StatelessWidget {
  const AuthPortraitLayout({
    super.key,
    required this.isPortrait,
    required this.backImage,
  });

  final bool isPortrait;
  final String backImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BuildBackGround(isPortrait: isPortrait, logo: backImage),
        Padding(
          padding: EdgeInsets.only(top: isPortrait ? 150.0 : 25),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
              double.infinity,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTitleImage(isPortrait: isPortrait,),
                  SizedBox(height: 50.h),
                  CustomButton(
                    text: "تسجيل الدخول",
                    color: AppColors.redColor,
                    width: 360.w,
                    onTap: () {
                      Get.to(
                        const LoginScreen(),
                        curve: Curves.bounceInOut,
                        duration: const Duration(seconds: 1),
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    text: "انشئ حساب",
                    color: AppColors.greenColor,
                    width: 360.w ,
                    onTap: () {
                      Get.to(const SignUpScreen());
                    },
                  ),
                  const Spacer(), // Push content to fill available space
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}