import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'nav_items.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 70.h,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50.r),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        const Positioned(
          top: -25,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItems(icon: CupertinoIcons.home, label: "Home"),
              NavItems(icon: Icons.search, label: "Search"),
              NavItems(icon: Icons.workspace_premium_outlined, label: "Premium"),
            ],
          ),
        ),
      ],
    );
  }
}