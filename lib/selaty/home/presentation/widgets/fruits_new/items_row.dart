import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../const.dart';
class ItemsRow extends StatelessWidget {
  const ItemsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          height: 25.h,
          width: 45.w,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            color: AppColors.greenColor,
          ),
          child: Text("جديد",style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
          ),),
        ),
        const Spacer(),
        Icon(Icons.favorite,color: AppColors.greenColor,size: 30,),
      ],
    );
  }
}