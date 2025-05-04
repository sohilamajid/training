import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String? title ;
  final bool isCenter;
  final Color? backgroundColor;
  final Color? color;
  const SharedAppBar({super.key,this.title,  this.isCenter= false, this.backgroundColor, this.color});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: isCenter,
      title: Text(
        title?? "",
        style: TextStyle(
          fontSize: 18.sp,
          color: color ?? Colors.black,
        ),
      ),
      backgroundColor: backgroundColor ?? const Color(0xFFe2e2e2),
      leading: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10),
        child: _buildAppBarIcons(icon: Icons.camera_alt_outlined,context: context),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 15),
          child: _buildAppBarIcons(icon: Icons.arrow_back_ios_new,context: context),
        ),
      ],
    );
  }

  Widget _buildAppBarIcons({
    required IconData icon,
    required BuildContext context
  }) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 50.h,
        width: 40.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
