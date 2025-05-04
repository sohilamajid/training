import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../const.dart';
class FruitItem extends StatelessWidget {
  const FruitItem({
    super.key,
    required this.image,
    required this.text,
    required this.label,
    required this.subtext,
  });

  final String image;
  final String text;
  final String label;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 35.0,left: 30,right: 10),
          child: Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: AppColors.fruitGreyColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0,left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text,style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                  ),),
                  Row(
                    children: [
                      Text(label,style: TextStyle(
                        color: AppColors.fruitGreenColor,
                        fontSize: 15.sp,
                      ),),
                      Icon(Icons.workspace_premium_outlined,color: AppColors.fruitGreenColor,size: 15.r,)
                    ],
                  ),
                  Text(subtext,style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                  ),),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -37,
          left: 30,
          child: SizedBox(
            width: 120.w,
            height: 120.h,
            child: Image.asset(image),
          ),
        ),
        Positioned(
          top: 130,
          left: 135,
          child: CircleAvatar(
            radius: 15.r,
            backgroundColor: Colors.white,
            child: const Icon(Icons.arrow_forward,color: Colors.black,),
          ),
        ),
      ],
    );
  }
}