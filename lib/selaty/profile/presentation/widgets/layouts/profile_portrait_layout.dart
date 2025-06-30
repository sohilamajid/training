import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:selaty/const.dart';
import 'package:selaty/selaty/auth/views/auth_screen.dart';
import '../profile_button.dart';
import '../profile_data.dart';
import '../userData/user_data.dart';

class ProfilePortraitLayout extends StatelessWidget {
  const ProfilePortraitLayout({super.key, required this.logo, required this.isPortrait});

  final String logo;
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileData(logo: logo, isPortrait: isPortrait,),
          SizedBox(height: 20.h),
          const UserData(),
          Padding(
            padding: EdgeInsets.only(right: 35.w, left: 35.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Get.to(const AuthScreen()),
                  child: ProfileButton(
                    backgroundColor: AppColors.greenColor,
                    icon: Icons.exit_to_app,
                    label: "خروج", isPortrait: isPortrait,
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
    );
  }
}