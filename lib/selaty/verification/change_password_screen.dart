import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:selaty/const.dart';
import 'package:selaty/selaty/login/widgets/custom_text_field.dart';
import 'package:selaty/selaty/shared_widgets/custom_app_bar.dart';
import 'package:selaty/selaty/shared_widgets/custom_button/custom_button.dart';
import 'package:selaty/selaty/verification/key_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _passwordController = TextEditingController();
  final _passwordController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBar(title: "تغيير كلمة المرور",isCenter: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "أدخل كلمة المرور الجديدة",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Column(
                    children: [
                      CustomTextField(height: height,
                          text: "كلمة المرور الحالي",
                          controller: _passwordController,
                          isPassword: true,
                      ),
                      CustomTextField(height: height,
                        text: "كلمة مرور جديدة",
                        controller: _passwordController2,
                        isPassword: true,
                      ),
                      SizedBox(height: 20.h,),
                      CustomButton(text: "تغيير", color: AppColors.greenColor, width: double.infinity,
                      onTap: () {
                        Get.to(const KeyScreen());
                      },),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
