import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const.dart';
import '../top_bar/right_stack_items.dart';

class TopItems extends StatelessWidget {
  const TopItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
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
          ),
          const StackItems(),
        ],
      ),
    );
  }
}