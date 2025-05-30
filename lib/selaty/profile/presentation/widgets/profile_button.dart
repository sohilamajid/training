import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProfileButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final String label;
  final bool isPortrait;

  const ProfileButton({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.label, required this.isPortrait,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isPortrait? 95.h : 140,
      width: isPortrait? 100.w : 70.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Container(
              height: 45.h,
              width: 45.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(.4),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30.r,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: isPortrait? 15.sp : 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}