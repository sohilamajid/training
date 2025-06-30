import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:selaty/const.dart';
import 'package:selaty/selaty/login/login_screen.dart';
import 'package:selaty/selaty/shared_widgets/custom_row_bottom.dart';
import 'package:selaty/selaty/shared_widgets/custom_button/custom_button.dart';
import 'package:selaty/selaty/sign_up/widgets/social-button.dart';
import '../../login/widgets/custom_text_field.dart';
import '../cubit/sign_up_cubit.dart';

class SignUpPortraitLayout extends StatelessWidget {
  const SignUpPortraitLayout({
    super.key,
    required this.height,
    required TextEditingController nameController,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) : _nameController = nameController, _formKey = formKey, _emailController = emailController, _passwordController = passwordController;

  final double height;
  final TextEditingController _nameController;
  final GlobalKey<FormState> _formKey;
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
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      "أنشاء حساب جديد",
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.start,
                      "أدخل بياناتك لإنشاء حساب",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                        height: height.h,
                        text: "الإسم",
                        controller: _nameController),
                    SizedBox(
                      height: 10.h,
                    ),
                    Form(
                      key: _formKey,
                      child: CustomTextField(
                        height: height.h,
                        controller: _emailController,
                        text: "عنوان البريد الإلكتروني/رقم الهاتف",
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
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextField(
                      height: height.h,
                      text: "كلمة المرور",
                      controller: _passwordController,
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    CustomButton<SignUpCubit, SignUpState>(
                      text: "اشتراك",
                      color: AppColors.greenColor,
                      width: double.infinity,
                      useBloc: true,
                      isLoadingState: (state) => state is SignUpLoadingState,
                      onTap: () {
                        if(_formKey.currentState!.validate()){
                          context.read<SignUpCubit>().signUp(
                              phone: _emailController.text,
                              password: _passwordController.text,
                              name: _nameController.text,
                          );}
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Center(
                      child: Text(
                        "أو اشترك مع",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SocialButton(
                                text: "Facebook",
                                icon: FontAwesomeIcons.facebook,
                                color: Color(0xFF23468a)),
                            SizedBox(width: 20.w),
                            const SocialButton(
                                text: "Google",
                                icon: FontAwesomeIcons.google,
                                color: Color(0xFFe05a59)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    CustomBottomRow(onTap: () {
                      Get.off(const LoginScreen());
                    }, text: "تسجيل الدخول",),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}