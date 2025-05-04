import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({
    super.key,
    required this.logo,
  });

  final String logo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 55.0),
            child: Container(
              width: 300.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: AppColors.greenColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "سهيله ماجد",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "sohila22@gmail.com",
                    style: TextStyle(color: Colors.white,
                    fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 58,
                backgroundColor: Colors.white.withOpacity(.3),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.greyColor,
                  child: Image.asset(logo,width: 70.w,height: 70.h,),
                ),
              ),
              const CircleAvatar(
                radius: 14,
                backgroundColor: Colors.red,
                child: Icon(Icons.camera_alt, size: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}