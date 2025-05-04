import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const.dart';
class FirstContainer extends StatelessWidget {
  const FirstContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.h,right: 20.w,left: 5.h,bottom: 20.h),
      margin: EdgeInsets.only(top: 15.h,left: 15.w),
      width: 330.w,
      height: 120.h,
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("معرف الطلب: OD2204#",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),),
              Text("تاريخ النشر 26 كانون الثاني(يناير) 2025",style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
              ),),
              Row(
                children: [
                  Text("البنود: 15",style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                  ),),
                  SizedBox(width: 25.w,),
                  Text("الاجمالي: 100 ريال",style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                  ),),
                ],
              ),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 45.r,
            child: Icon(Icons.coffee_outlined,color: const Color(0xFF2e1a59),size: 50.r,),
          ),
        ],
      ),
    );
  }
}