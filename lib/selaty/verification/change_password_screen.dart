import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:training/selaty/login/widgets/custom_text_field.dart';
import 'package:training/selaty/verification/key_screen.dart';

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
      appBar: _buildAppBar(),
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
                Text(
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
                      InkWell(
                        onTap: () {
                          Get.to(KeyScreen());
                        },
                        child: Container(
                          height: 55.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFF2ac17e),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "تغيير",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
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


  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Center(
        child: Text(
          "تغيير كلمة المرور",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      leading: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10),
        child: _buildAppBarIcons(icon: Icons.linked_camera_outlined),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 15),
          child: _buildAppBarIcons(icon: Icons.arrow_back_ios_new),
        ),
      ],
    );
  }

  Widget _buildAppBarIcons({
    required IconData icon,
  }) {
    return Container(
      height: 50.h,
      width: 40.w,
      child: Center(
        child: Icon(
          icon,
          color: Colors.black,
          size: 24,
        ),
      ),
    );
  }
}
