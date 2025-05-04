import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const.dart';
import '../../login/login_screen.dart';
import '../../shared_widgets/back_ground/back_ground_image.dart';
import '../../shared_widgets/custom_button/custom_button.dart';
import '../../shared_widgets/custom_title_image/title_image.dart';
import '../../sign_up/sign_up_screen.dart';

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
                  BuildBackGround(isPortrait: isPortrait, logo: backImage),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: isPortrait ? 150.0 : 25),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight:
                              constraints.maxHeight, // Ensures full height
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CustomTitleImage(),
                              SizedBox(height: 50.h),
                              CustomButton(
                                text: "تسجيل الدخول",
                                color: AppColors.redColor,
                                width: constraints.maxWidth,
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
                                width: constraints.maxWidth,
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
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
