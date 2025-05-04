import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/selaty/profile/presentation/widgets/userData/user_icon_title.dart';
class UserData extends StatelessWidget {
  const UserData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: GridView.builder(
        padding: EdgeInsets.only(right: 45.w,left: 45.w),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 15.r,
            mainAxisSpacing: 15.r,
            childAspectRatio: 1.2 / 1),
        itemBuilder: (context,index) => const UserIconTile(name: "علي",),
        itemCount: 9,
      ),
    );
  }
}