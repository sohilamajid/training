// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'widgets/custom_text_field.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _passwordController = TextEditingController();
//   final _emailController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     String backImage = "assets/images/logo.png";
//     var height = MediaQuery.sizeOf(context).height;
//
//     return Scaffold(
//       appBar: _buildAppBar(),
//       body: Container(
//         width: double.infinity,
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           _buildText(text: "ســـــلتي" , color: Color(0xFFd6262b)),
//                           _buildText(text: "S E L A T Y", color: Colors.black),
//                         ],
//                       ),
//                       SizedBox(width: 20.w,),
//                       Center(
//                         child: Container(
//                           height: 120.h,
//                           width: 120.w,
//                           child: Image.asset(backImage),
//                         ),
//                       ),
//
//                     ],
//                   ),
//                   // SizedBox(height: 20.h,),
//                   Form(
//                     key: _formKey,
//                     child: CustomTextField(
//                       height: height.h,
//                       controller: _emailController,
//                       text: "عنوان البريد الإلكتروني",
//                       isEmail: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "هذا الحقل فارغ";
//                         }
//                         if (value.length < 11) {
//                           return "البريد الإلكتروني قصير جدا";
//                         }
//                         bool emailValid = RegExp(
//                             r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
//                             .hasMatch(value);
//                         if (!emailValid) {
//                           return "صيغة البريد الإلكتروني غير صحيحة";
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   CustomTextField(
//                     height: height.h,
//                     text: "كلمة السر",
//                     controller: _passwordController,
//                     isPassword: true,
//                   ),
//                   SizedBox(height: 10.h,),
//                   Text("هل نسيت كلمة السر؟",style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                   ),),
//                   SizedBox(height: 20.h,),
//                   InkWell(
//                     onTap: () {
//                       _formKey.currentState!.validate();
//                     },
//                     child: Container(
//                       height: 55.h,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Color(0xFF2ac17e),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Center(
//                         child: Text(
//                           "تسجيل الدخول",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 23,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 43.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "لديك حساب بالفعل؟",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Spacer(),
//                       Icon(Icons.arrow_left_outlined, size: 40, color: Colors.black),
//                       Text(
//                         "تسجيل الدخول",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   AppBar _buildAppBar() {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: Colors.grey[100],
//       leading: Padding(
//         padding: const EdgeInsets.only(top: 10, right: 10),
//         child: _buildAppBarIcons(icon: Icons.linked_camera_outlined),
//       ),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(top: 10, left: 15),
//           child: _buildAppBarIcons(icon: Icons.arrow_back_ios_new),
//         ),
//       ],
//     );
//   }
//
//
//   Widget _buildAppBarIcons({
//     required IconData icon,
//   }) {
//     return Container(
//       height: 50.h,
//       width: 40.w,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         border: Border(
//           top: BorderSide(
//               color: Colors.black.withOpacity(.2),
//               width: 2), // Top black border
//           right: BorderSide(
//               color: Colors.black.withOpacity(.2),
//               width: 2), // Right black border
//           bottom: BorderSide(
//               color: Colors.black.withOpacity(.2), width: 2), // Invisible
//           left: BorderSide(
//               color: Colors.black.withOpacity(.2), width: 2), // Invisible
//         ),
//       ),
//       child: Center(
//         child: Icon(
//           icon,
//           color: Colors.black,
//           size: 24,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildText({
//     required String text,
//     required  Color? color,
//   }) {
//     return Text(text,style: TextStyle(
//         fontSize: 30.sp,
//         color: color,
//         fontWeight: FontWeight.bold
//       // fontFamily: ArabicFont,
//     ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:training/selaty/verification/change_password_screen.dart';
import 'package:training/selaty/verification/verification_screen.dart';
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
    String backImage = "assets/images/logo.png";
    var height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: _buildAppBar(),
      body: LayoutBuilder(
          builder: (context, constraints){
            return OrientationBuilder(
                builder: (context, orientation) {
                  return SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      _buildText(text: "ســـــلتي" , color: Color(0xFFd6262b)),
                                      _buildText(text: "S E L A T Y", color: Colors.black),
                                    ],
                                  ),
                                  SizedBox(width: 20.w,),
                                  Center(
                                    child: Container(
                                      height: 120.h,
                                      width: 120.w,
                                      child: Image.asset(backImage),
                                    ),
                                  ),

                                ],
                              ),
                              // SizedBox(height: 20.h,),
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
                              SizedBox(height: 10.h,),
                              InkWell(
                                onTap: (){
                                  Get.to(ChangePasswordScreen());
                                },
                                child: Text("هل نسيت كلمة السر؟",style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),),
                              ),
                              SizedBox(height: 20.h,),
                              InkWell(
                                onTap: () {
                                  if(_formKey.currentState!.validate()){
                                    Get.to(VerifyScreen());
                                  }
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
                                      "تسجيل الدخول",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 43.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "لديك حساب بالفعل؟",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_left_outlined, size: 40, color: Colors.black),
                                  Text(
                                    "تسجيل الدخول",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
             }
            );
          }
      )
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

  Widget _buildText({
    required String text,
    required  Color? color,
  }) {
    return Text(text,style: TextStyle(
        fontSize: 30.sp,
        color: color,
        fontWeight: FontWeight.bold
      // fontFamily: ArabicFont,
    ),
    );
  }
}
