import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const.dart';
class PlantAppBar extends StatelessWidget implements PreferredSizeWidget{
  const PlantAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.plantColor,
      title: Center(
        child: Text("Decorative flowers",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            )),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.menu,
            color: Colors.white.withOpacity(.7),
          ),
        ),
      ],
      leading: Icon(
        Icons.arrow_back_ios_new,
        color: Colors.white.withOpacity(.7),
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}