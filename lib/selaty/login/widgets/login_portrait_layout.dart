import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const.dart';
import '../../shared_widgets/custom_button/custom_button.dart';
import '../../shared_widgets/custom_row_bottom.dart';
import '../../shared_widgets/custom_title_image/title_image.dart';
import '../../sign_up/sign_up_screen.dart';
import '../../verification/change_password_screen.dart';
import '../cubit/login_cubit.dart';
import 'custom_text_field.dart';

class LoginPortraitLayout extends StatelessWidget {
  const LoginPortraitLayout({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.height,
    required TextEditingController emailController,
    required TextEditingController passwordController, required this.isPortrait,
  }) : _formKey = formKey, _emailController = emailController, _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final bool isPortrait;
  final double height;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
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
                CustomTitleImage(isPortrait: isPortrait,),
                SizedBox(
                  height: 20.h,
                ),
                Form(
                  key: _formKey,
                  child: CustomTextField(
                    height: height.h,
                    controller: _emailController,
                    text: "رقم الهاتف/عنوان البريد الإلكتروني",
                    isEmail: true,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return "هذا الحقل فارغ";
                    //   }
                    //   if (value.length < 11) {
                    //     return "البريد الإلكتروني قصير جدا";
                    //   }
                    //   bool emailValid = RegExp(
                    //       r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                    //       .hasMatch(value);
                    //   if (!emailValid) {
                    //     return "صيغة البريد الإلكتروني غير صحيحة";
                    //   }
                    //   return null;
                    // },
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
                CustomButton<LoginCubit, LoginState>(
                  text: "تسحيل الدخول",
                  color: AppColors.greenColor,
                  width: double.infinity,
                  useBloc: true,
                  isLoadingState: (state) => state is LoginLoadingState,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<LoginCubit>().login(
                          phone: _emailController.text,
                          password: _passwordController.text);
                      // Get.to(const VerifyScreen());
                    }
                  },
                ),
                SizedBox(height: 55.h),
                CustomBottomRow(onTap: () {
                  Get.off(const SignUpScreen());
                }, text: "انشاء حساب",),
              ],
            ),
          ),
        ),
      ),
    );
  }
}