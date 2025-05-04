import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UserCircle extends StatelessWidget {
  const UserCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -15,
      top: -25,
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: const Color(0xFF2a2b2e),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(80),
        ),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: const Color(0xFF2a2b2e),
            border: Border.all(
              color: Colors.green,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(80),
          ),
          child: CircleAvatar(
            backgroundImage: const AssetImage("assets/images/user.jpg"),
            radius: 18.r,
          ),
        ),
      ),
    );
  }
}