import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../const.dart';
class StackItems extends StatelessWidget {
  const StackItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top:25.0),
          child: Container(
            width: 70.w,
            height: 75.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("10",style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                Text("Products",style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),
          ),
        ),
        Positioned(
          right: 13.w,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 22.r,
            child: Icon(Icons.shopping_bag_outlined,color: Colors.white.withOpacity(.6),),
          ),
        ),
        Positioned(
          right: 18.w,
          child: CircleAvatar(
            backgroundColor: AppColors.fruitGreenColor,
            radius: 6.r,
          ),
        ),
      ],
    );
  }
}