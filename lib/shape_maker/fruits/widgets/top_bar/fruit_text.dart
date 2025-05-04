import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const.dart';

class FruitText extends StatelessWidget {
  const FruitText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, top: 90.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Exotic",style: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
          ),),
          Text("fruits",style: TextStyle(
            color: AppColors.fruitGreenColor,
            fontSize: 25.sp,
          ),),
        ],
      ),
    );
  }
}