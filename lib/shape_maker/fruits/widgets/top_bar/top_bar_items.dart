import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/shape_maker/fruits/widgets/top_bar/right_stack_items.dart';
import 'package:selaty/shape_maker/fruits/widgets/top_bar/user_circle.dart';
import '../../../../const.dart';
import 'fruit_text.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150.w,
          height: 190.h,
          child: const Stack(
            children: [
              UserCircle(),
              FruitText(),
            ],
          ),
        ),
        Column(
          children: [
            const StackItems(),
            SizedBox(height: 45.h,),
            Text("see more",style: TextStyle(
              color: AppColors.fruitGreenColor,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),),
          ],
        ),
      ],
    );
  }
}



