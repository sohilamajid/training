import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:training/const.dart';
import 'package:training/selaty/shared_widgets/custom_button/custom_button.dart';
import 'package:training/selaty/verification/change_password_screen.dart';
import 'package:training/selaty/verification/verification_screen.dart';
import '../shared_widgets/custom_row_bottom.dart';
import '../shared_widgets/custom_app_bar.dart';
import '../shared_widgets/custom_title_image/title_image.dart';
import 'widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;

    return Scaffold(
        appBar: const CustomAppBar(),
        body: LayoutBuilder(builder: (context, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            return SizedBox(
              width: double.infinity,
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CustomTitleImage(),
                        SizedBox(
                          height: 20.h,
                        ),
                        Form(
                          key: _formKey,
                          child: CustomTextField(
                            height: height.h,
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
                                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                  .hasMatch(value);
                              if (!emailValid) {
                                return "صيغة البريد الإلكتروني غير صحيحة";
                              }
                              return null;
                            },
                          ),
                        ),
                        CustomTextField(
                          height: height.h,
                          text: "كلمة السر",
                          controller: _passwordController,
                          isPassword: true,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const ChangePasswordScreen());
                          },
                          child: Text(
                            "هل نسيت كلمة السر؟",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomButton(
                          text: "تسحيل الدخول",
                          color: AppColors.greenColor,
                          width: double.infinity,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Get.to(const VerifyScreen());
                            }
                          },
                        ),
                        SizedBox(height: 55.h),
                        const CustomBottomRow(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        }));
  }
}
