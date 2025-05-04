import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../text/custom_text.dart';

class CustomTitleImage extends StatelessWidget {
  const CustomTitleImage({super.key});

  @override
  Widget build(BuildContext context) {
    String backImage = "assets/images/logo.png";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
                text: "ســـــلتي",
                color: const Color(0xFFd6262b),
                fontSize: 30.sp),
            CustomText(
                text: "S E L A T Y",
                color: Colors.black,
                fontSize: 30.sp),
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        Center(
          child: Container(
            height: 120.h,
            width: 120.w,
            child: Image.asset(backImage),
          ),
        ),
      ],
    );
  }
}
