import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:selaty/const.dart';
import 'package:selaty/selaty/shared_widgets/custom_button/custom_button.dart';
import 'package:selaty/selaty/sign_up/sign_up_screen.dart';
import 'package:selaty/selaty/verification/change_password_screen.dart';
import 'package:selaty/selaty/verification/verification_screen.dart';
import '../../shared_widgets/custom_row_bottom.dart';
import '../../shared_widgets/custom_title_image/title_image.dart';
import 'custom_text_field.dart';

class LoginLandLayout extends StatelessWidget {
  const LoginLandLayout({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.height,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.isPortrait,
  }) : _formKey = formKey,
       _emailController = emailController,
       _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final double height;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h, right: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: Form(
                          key: _formKey,
                          child: CustomTextField(
                            height: height,
                            controller: _emailController,
                            text: "عنوان البريد الإلكتروني",
                            isEmail: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "هذا الحقل فارغ";
                              }
                              if (value.length < 11) {
                                return "البريد الإلكتروني قصير جدا";
                              }
                              bool emailValid = RegExp(
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                              ).hasMatch(value);
                              if (!emailValid) {
                                return "صيغة البريد الإلكتروني غير صحيحة";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: 150.w,
                        child: CustomTextField(
                          height: height.h,
                          text: "كلمة السر",
                          controller: _passwordController,
                          isPassword: true,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      InkWell(
                        onTap: () {
                          Get.to(const ChangePasswordScreen());
                        },
                        child: Text(
                          "هل نسيت كلمة السر؟",
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomButton(
                        text: "تسحيل الدخول",
                        color: AppColors.greenColor,
                        width: 160.w,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Get.to(const VerifyScreen());
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CustomTitleImage(isPortrait: isPortrait),
              ],
            ),
            SizedBox(height: 20.h),
            CustomBottomRow(
              onTap: () {
                Get.off(const SignUpScreen());
              },
              text: "انشاء حساب",
            ),
          ],
        ),
      ),
    );
  }
}
