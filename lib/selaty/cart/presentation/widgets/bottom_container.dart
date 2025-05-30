import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key, required this.isPortrait,
  });
  final bool isPortrait ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      height: isPortrait ? 120.h : 180.h,
      width: 330.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 15.w),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("البنود",style: TextStyle(
                  color: Colors.grey,
                  fontSize: isPortrait ? 16.sp : 11.sp,
                  fontWeight: FontWeight.bold,
                ),),
                Text("المجموع الفرعي",style: TextStyle(
                  color: Colors.grey,
                  fontSize: isPortrait ? 16.sp : 11.sp,
                  fontWeight: FontWeight.bold,
                ),),
                Text("رسوم التوصيل",style: TextStyle(
                  color: Colors.grey,
                  fontSize: isPortrait ? 16.sp : 11.sp,
                  fontWeight: FontWeight.bold,
                ),),
                Text("الاجمالي",style: TextStyle(
                  color: Colors.black,
                  fontSize: isPortrait ? 17.sp : 13.sp,
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),
            Spacer(),
            // SizedBox(width: 90.w,),
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("4",style: TextStyle(
                    color: Colors.grey,
                    fontSize: isPortrait ? 15.sp : 10.sp,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text("100.00 \$",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: isPortrait ? 15.sp : 10.sp,
                      fontWeight: FontWeight.bold,
                    ),),
                  Text("Free",style: TextStyle(
                    color: Colors.grey,
                    fontSize: isPortrait ? 15.sp : 10.sp,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text("100.00 SAR",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: isPortrait ? 17.sp : 13.sp,
                      fontWeight: FontWeight.bold,
                    ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}