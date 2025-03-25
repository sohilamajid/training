import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../onboarding/page_view_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4)).then((value) =>
    Get.offAll(PageViewScreen()),);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String backImage = "assets/images/background.jpg";
    String logo = "assets/images/logo.png";
    String? loading = "assets/images/loading.gif";

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(child: Image.asset(backImage, fit: BoxFit.fill)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 150.h,
                  width: 150.w,
                  child: Image.asset(logo),
                ),
              ),
              _buildText(text: "ســـــلتي" , color: Color(0xFFd6262b)),
              _buildText(text: "S E L A T Y", color: Colors.black),
              SizedBox(height: 20.h,),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Image.asset(loading),
              ),
            ],
          ),
        ],
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
              // fontFamily: ArabicFont,
             ),
            );
  }
}
