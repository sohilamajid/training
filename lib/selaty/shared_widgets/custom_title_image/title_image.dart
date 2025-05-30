import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../text/custom_text.dart';

class CustomTitleImage extends StatelessWidget {
  const CustomTitleImage({super.key, required this.isPortrait});

  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    String backImage = "assets/images/logo.png";

    return Flex(
      direction: isPortrait ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: "ســـــلتي",
              color: const Color(0xFFd6262b),
              fontSize: isPortrait ? 30.sp : 18.sp,
            ),
            CustomText(
              text: "S E L A T Y",
              color: Colors.black,
              fontSize: isPortrait ? 30.sp : 18.sp,
            ),
          ],
        ),
        SizedBox(
          width: isPortrait ? 10.w : 0,
          height: isPortrait ? 0 : 20.h,
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
