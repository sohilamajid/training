import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class PriceColumn extends StatelessWidget {
  const PriceColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("£2.75",style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
        ),),
        SizedBox(height: 2.h,),
        Text("£2.00",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
        ),),
      ],
    );
  }
}