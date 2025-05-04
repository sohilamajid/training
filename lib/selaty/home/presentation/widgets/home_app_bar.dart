import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    String logo = "assets/images/logo.png";
    return AppBar(
      backgroundColor: const Color(0xFFe2e2e2),
      elevation: 0,
      actions: [_buildAppBarActions(),],
      title: _buildAppBarTitle(),
      leading: _buildAppBarLeading(logo),
    );
  }

  Padding _buildAppBarLeading(String person) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 25,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 22,
          backgroundImage: AssetImage(person),
        ),
      )
    );
  }

  Column _buildAppBarTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Text("سهيله ماجد",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
            ),),
        ),
        Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 13,
              child: Icon(CupertinoIcons.location_solid,color: Colors.red,),
            ),
            Text("المنوفية-شبين الكوم",style: TextStyle(
              fontSize: 15.sp,
              color: Colors.grey,
            ),)
          ],
        ),
      ],
    );
  }

  Padding _buildAppBarActions() {
    return Padding(
        padding: const EdgeInsets.only(top: 6.0,left: 10),
        child: Container(
          height: 60.h,
          width: 45.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.camera_alt_outlined,color: Colors.black),
        ),
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
