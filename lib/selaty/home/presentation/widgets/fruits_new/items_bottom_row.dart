import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../const.dart';
class BottomRow extends StatelessWidget {
  const BottomRow({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,//delete width and adjust left , right positions
      right: 0,
      child: Container(
        height: 35.h,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          color: AppColors.greyColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0,left: 8),
          child: Row(
            children: [
              Text("40 EGP",style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),),
              const Spacer(),
              CircleAvatar(
                backgroundColor: AppColors.redColor,
                child: const Icon(Icons.shop,color: Colors.white,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
