import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:training/selaty/login/login_screen.dart';
import '../login/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),
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
                          const TextWidget(),
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
                          InkWell(
                            onTap: () {
                              _formKey.currentState!.validate();
                            },
                            child: Container(
                              height: 55.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2ac17e),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "اشتراك",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h,),
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
                                  _buildSocialButton(
                                    text: "Facebook",
                                    icon: FontAwesomeIcons.facebook,
                                    color: const Color(0xFF23468a),
                                  ),
                                  SizedBox(width: 20.w),
                                  _buildSocialButton(
                                    text: "Google",
                                    icon: FontAwesomeIcons.google,
                                    color: const Color(0xFFe05a59),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 40.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "لديك حساب بالفعل؟",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_left_outlined,
                                  size: 40, color: Colors.black),
                              InkWell(
                                onTap: () {
                                  Get.to(const LoginScreen());
                                },
                                child: const Text(
                                  "تسجيل الدخول",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      }),
    );
  }




  Widget _buildSocialButton({
    required String text,
    required IconData icon,
    required Color color,
  }) {
    return OutlinedButton.icon(
      onPressed: () {
        // Add social login logic here
      },
      icon: FaIcon(icon, color: color, size: 20),
      label: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: color,
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: BorderSide(color: color, width: 1.5),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border(
          top: BorderSide(
              color: Colors.black.withOpacity(.2),
              width: 2), // Top black border
          right: BorderSide(
              color: Colors.black.withOpacity(.2),
              width: 2), // Right black border
          bottom: BorderSide(
              color: Colors.black.withOpacity(.2), width: 2), // Invisible
          left: BorderSide(
              color: Colors.black.withOpacity(.2), width: 2), // Invisible
        ),
      ),
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

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.start,
      "أدخل بياناتك لإنشاء حساب",
      style: TextStyle(
        fontSize: 20.sp,
        color: Colors.grey,
      ),
    );
  }
}
