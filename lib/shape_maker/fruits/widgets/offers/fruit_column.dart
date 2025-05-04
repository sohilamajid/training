import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../const.dart';
class FruitColumn extends StatelessWidget {
  const FruitColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Guava",style: TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
        ),),
        Row(
          children: [
            Text("PREMIUM",style: TextStyle(
              color: AppColors.fruitGreenColor,
              fontSize: 15.sp,
            ),),
            SizedBox(width: 5.w,),
            Icon(Icons.workspace_premium_outlined,color: AppColors.fruitGreenColor,size: 14.r,)
          ],
        ),
      ],
    );
  }
}
