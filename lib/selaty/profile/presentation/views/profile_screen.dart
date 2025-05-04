import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:selaty/const.dart';
import 'package:selaty/selaty/auth/views/auth_screen.dart';
import 'package:selaty/selaty/profile/presentation/widgets/appBar/profile_appBar.dart';
import '../widgets/profile_button.dart';
import '../widgets/profile_data.dart';
import '../widgets/userData/user_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String logo = "assets/images/logo.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe2e2e2),
      appBar: const SharedAppBar(),
      // bottomNavigationBar: CustomNavigationBar(logo: logo),
      body: Column(
        children: [
          ProfileData(logo: logo),
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
                      label: "خروج"),
                ),
                const Spacer(),
                ProfileButton(
                    backgroundColor: AppColors.redColor,
                    icon: Icons.help_center_outlined,
                    label: "مركز الدعم"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


