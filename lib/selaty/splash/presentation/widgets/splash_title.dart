import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared_widgets/text/custom_text.dart';

class SplashTitle extends StatelessWidget {
  final bool isPortrait;

  const SplashTitle({super.key, required this.isPortrait});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isPortrait ? 0 : 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: isPortrait
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          CustomText(text: "ســـــلتي", color: const Color(0xFFd6262b), fontSize: isPortrait ? 30.sp : 28.sp),
          CustomText(text: "S E L A T Y", color: Colors.black, fontSize: isPortrait ? 26.sp : 24.sp),
        ],
      ),
    );
  }

}
