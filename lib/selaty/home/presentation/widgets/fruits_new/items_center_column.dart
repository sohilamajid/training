import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../const.dart';

class CenterColumn extends StatelessWidget {
  const CenterColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 25.h,
            width: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.orangeColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text("فواكه",style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
              ),),
            ),
          ),
          Text("طبق فواكه",style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey,
          ),),
          Text("kg 1",style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey,
          ),),
        ],
      ),
    );
  }
}