import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../login/login_screen.dart';
import '../sign_up/sign_up_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String backImage = "assets/images/logo.png";
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Stack(
        children: [
          _buildBackGround(backImage),
          Padding(
            padding: const EdgeInsets.only(top:150.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        height: 120.h,
                        width: 120.w,
                        child: Image.asset(backImage),
                      ),
                    ),
                    SizedBox(width: 20.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildText(text: "ســـــلتي" , color: Color(0xFFd6262b)),
                        _buildText(text: "S E L A T Y", color: Colors.black),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50.h,),
                _button(text: "تسجيل الدخول",
                    color: Color(0xFFef3f4c),
                    width: width,
                    onTap: (){
                      Get.to(
                        LoginScreen(),
                        curve: Curves.bounceInOut,
                        duration: Duration(seconds: 1),
                      );
                    }
                ),
                SizedBox(height: 20,),
                _button(text: "انشئ حساب",
                    color: Color(0xFF2ac17e),
                    width: width,
                    onTap: (){
                      Get.to(SignUpScreen());
                    }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }






  Widget _button({
    required String text,
    required Color color,
    required double width,
    void Function()? onTap
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: width * .9,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),)),
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


  Widget _buildBackGround(String backImage) {
    return Positioned(
      bottom: -100, // Move it slightly down to prevent top cropping
      right: -50,  // Move it left to prevent left cropping
      child: Opacity(
        opacity: 0.08, // Faded effect
        child: ClipRect( // Crop effect
          child: Align(
            alignment: Alignment.bottomRight, // Ensure correct positioning
            widthFactor: 0.9, // Crops slightly from right
            heightFactor: 1.5, // Crops slightly from bottom
            child: Image.asset(
              backImage,
              width: 280.w, // Increased size
              height: 280.h, // Increased size
              fit: BoxFit.cover, // Ensures it fills properly
            ),
          ),
        ),
      ),
    );
  }




// Widget _buildBackGround(String backImage) {
  //   return Positioned(
  //         bottom: 0,
  //         right: 0,
  //         child: Opacity(
  //           opacity: 0.08,
  //           child: Padding(
  //             padding: const EdgeInsets.only(left: 20.0),
  //             child: ClipRRect(
  //               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
  //               child: Container(
  //                 width: 100,
  //                 height: 170.h,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
  //                   image: DecorationImage(image: AssetImage(backImage))
  //                 ),
  //                 // child: Image.asset(
  //                 //   backImage,
  //                 //   fit: BoxFit.contain,
  //                 //   color: Colors.grey,
  //                 //   colorBlendMode: BlendMode.modulate,
  //                 // ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  // }
}
