import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:selaty/const.dart';
import 'package:selaty/selaty/auth/views/auth_screen.dart';
import 'package:selaty/selaty/profile/presentation/widgets/appBar/profile_appBar.dart';
import '../widgets/layouts/profile_portrait_layout.dart';
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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              bool isPortrait = orientation == Orientation.portrait;
              return isPortrait
                  ? ProfilePortraitLayout(logo: logo, isPortrait: isPortrait)
                  : Padding(
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
            },
          );
        },
      ),
    );
  }
}
