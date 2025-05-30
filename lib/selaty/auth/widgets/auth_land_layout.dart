import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const.dart';
import '../../login/login_screen.dart';
import '../../shared_widgets/back_ground/back_ground_image.dart';
import '../../shared_widgets/custom_button/custom_button.dart';
import '../../shared_widgets/custom_title_image/title_image.dart';
import '../../sign_up/sign_up_screen.dart';

class AuthLandLayout extends StatelessWidget {
  const AuthLandLayout({
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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButton(
                  text: "تسجيل الدخول",
                  color: AppColors.redColor,
                  width: 180.w,
                  onTap: () {
                    Get.to(
                      const LoginScreen(),
                      curve: Curves.bounceInOut,
                      duration: const Duration(seconds: 1),
                    );
                  },
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  text: "انشئ حساب",
                  color: AppColors.greenColor,
                  width: 180.w ,
                  onTap: () {
                    Get.to(const SignUpScreen());
                  },
                ),
              ],
            ),
            SizedBox(width: 50.w),
            CustomTitleImage(isPortrait: isPortrait),
          ],
        ),
      ],
    );
  }
}