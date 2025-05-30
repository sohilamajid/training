import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:selaty/selaty/login/login_screen.dart';
import 'widgets/dotted_circle.dart';

class KeyScreen extends StatelessWidget {
  const KeyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String keyImage = "assets/images/key.png";
    return Scaffold(
      backgroundColor: const Color(0xFF2ac17e),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: const Size(260, 260), // Increased circle size
                    painter: DottedCirclePainter(),
                  ),
                  Image.asset(
                    keyImage,
                    width: 160, // Slightly increased image size
                    height: 160,
                  ),
                ],
              ),
              SizedBox(height: 60.h,),
              const Text("كلمة المرور الخاصة بك لها",style: TextStyle(
                fontSize: 23,
                color: Colors.white,
              ),
              ),
              SizedBox(height: 30.h,),
              InkWell(
                onTap: () {

                },
                child: Container(
                  height: 55.h,
                  width: 220.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () => Get.offAll(LoginScreen()),
                    child: const Center(
                      child: Text(
                        "تم",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




