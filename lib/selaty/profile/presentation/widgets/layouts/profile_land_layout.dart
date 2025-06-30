import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:selaty/const.dart';
import 'package:selaty/selaty/auth/views/auth_screen.dart';
import '../profile_button.dart';
import '../profile_data.dart';
import '../userData/user_data.dart';

class ProfileLandLayout extends StatelessWidget {
  const ProfileLandLayout({
    super.key,
    required this.logo,
    required this.isPortrait,
  });

  final String logo;
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w, left: 10.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                    flex: 1,
                    child: const UserData()),
                SizedBox(
                    height: 210.h,
                    child: ProfileData(logo: logo, isPortrait: isPortrait)),
              ],
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.only(right: 35.w, left: 35.w,bottom: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Get.to(const AuthScreen()),
                    child: ProfileButton(
                      backgroundColor: AppColors.greenColor,
                      icon: Icons.exit_to_app,
                      label: "خروج",
                      isPortrait: isPortrait,
                    ),
                  ),
                  const Spacer(),
                  ProfileButton(
                    backgroundColor: AppColors.redColor,
                    icon: Icons.help_center_outlined,
                    label: "مركز الدعم",
                    isPortrait: isPortrait,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}