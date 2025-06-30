import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:selaty/selaty/profile/presentation/views/update_profile_screen.dart';
import 'package:selaty/selaty/profile/cubit/profile_cubit.dart';
import '../../../../const.dart';
import '../../../helper/api_url.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({
    super.key,
    required this.logo,
    required this.isPortrait,
  });

  final String logo;
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final profileCubit = context.read<ProfileCubit>();
        final user = profileCubit.profileModel.data;

        if (state is ProfileLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProfileErrorState || user == null) {
          return const Center(child: Text("فشل تحميل البيانات"));
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 55.0),
                child: Container(
                  width: isPortrait ? 300.w : 140.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: AppColors.greenColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        user.name ?? '',
                        style: TextStyle(
                            fontSize: isPortrait ? 15.sp : 10.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        user.email ?? '',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: isPortrait ? 14.sp : 10.sp),
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
                      backgroundImage: user.profilePhotoUrl != null
                          ? NetworkImage('${ApiUrl.imageBaseUrl}${user.profilePhotoPath}')
                          : null,
                      child: user.profilePhotoUrl == null
                          ? Image.asset(logo, width: 70.w, height: 70.h)
                          : null,
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(UpdateProfileScreen()),
                    child: const CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.red,
                      child:
                      Icon(Icons.camera_alt, size: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}