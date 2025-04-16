import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../const.dart';
class FruitImage extends StatelessWidget {
  const FruitImage({
    super.key,
    required this.fruitIcon,
  });

  final String fruitIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 30.h,
          color: AppColors.greenColor,
        ),
        Center(
          child: CircleAvatar(
            radius: 58,
            backgroundColor: Colors.white.withOpacity(.3),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Image.asset(fruitIcon,width: 70.w,height: 70.h,),
            ),
          ),
        ),
      ],
    );
  }
}