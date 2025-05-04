import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String? title ;
  final bool isCenter;
  const CustomAppBar({super.key,this.title,  this.isCenter= false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: isCenter,
      title: Text(
        title?? "",
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.grey[100],
      leading: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10),
        child: _buildAppBarIcons(icon: Icons.linked_camera_outlined,context: context),
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
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 50.h,
        width: 40.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border(
            top: BorderSide(
                color: Colors.black.withOpacity(.2),
                width: 2), // Top black border
            right: BorderSide(
                color: Colors.black.withOpacity(.2),
                width: 2), // Right black border
            bottom: BorderSide(
                color: Colors.black.withOpacity(.2), width: 2), // Invisible
            left: BorderSide(
                color: Colors.black.withOpacity(.2), width: 2), // Invisible
          ),
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
