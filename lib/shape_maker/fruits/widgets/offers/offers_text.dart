import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../const.dart';
class OffersRow extends StatelessWidget {
  const OffersRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Offers",style: TextStyle(
            color: Colors.white,
            fontSize: 30.sp,
          ),),
          Text("see more",style: TextStyle(
            color: AppColors.fruitGreenColor,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),),
        ],
      ),
    );
  }
}