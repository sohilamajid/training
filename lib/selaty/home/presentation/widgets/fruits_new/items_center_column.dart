import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../const.dart';

class CenterColumn extends StatelessWidget {
  const CenterColumn({
    super.key, required this.isPortrait,
  });
  final bool isPortrait ;

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
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0,top: 2),
              child: Text("فواكه",style: TextStyle(
                fontSize: isPortrait? 15.sp : 10.sp,
                color: Colors.white,
              ),),
            ),
          ),
          Text("طبق فواكه",style: TextStyle(
            fontSize: isPortrait? 16.sp: 11.sp,
            color: Colors.grey,
          ),),
          Text("kg 1",style: TextStyle(
            fontSize: isPortrait ? 16.sp : 11.sp,
            color: Colors.grey,
          ),),
        ],
      ),
    );
  }
}