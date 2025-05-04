import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const.dart';
class ItemsColumn extends StatelessWidget {
  const ItemsColumn({
    super.key,
    required this.text,
    required this.subtext,
    required this.number,
  });

  final String text;
  final String subtext;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingBarIndicator(
          rating: 2.75,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemCount: 5,
          itemSize: 10.0,
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        Text(
          subtext,
          style: TextStyle(
            color: AppColors.plantColor,
            fontSize: 15.sp,
          ),
        ),
        Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 10.r,
                  backgroundColor: AppColors.lightGreenColor,
                ),
                Positioned(
                    bottom: 7,
                    left: 3,
                    child: Icon(
                      Icons.minimize,
                      size: 15.r,
                      color: Colors.black,
                    )),
              ],
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              number,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            CircleAvatar(
              radius: 10.r,
              backgroundColor: AppColors.lightGreenColor,
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 12.r,
              ),
            ),
          ],
        ),
      ],
    );
  }
}