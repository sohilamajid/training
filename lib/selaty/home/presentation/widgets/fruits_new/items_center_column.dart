import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../const.dart';

class CenterColumn extends StatelessWidget {
  const CenterColumn({
    super.key,
    required this.isPortrait,
    required this.title,
    required this.unit,
  });

  final bool isPortrait;
  final String title;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: isPortrait ? 25.h : 40.h,
            width: isPortrait ? 80.w : 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.orangeColor,
            ),
            alignment: Alignment.center,
            child: Text("المنتجات",
              style: TextStyle(
                fontSize: isPortrait ? 15.sp : 10.sp,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: isPortrait ? 16.sp : 11.sp,
              color: Colors.grey,
            ),
          ),
          Text(
            unit,
            style: TextStyle(
              fontSize: isPortrait ? 16.sp : 11.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}