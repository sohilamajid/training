import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../const.dart';

class BuildItems extends StatelessWidget {
  const BuildItems({
    super.key,
    required this.width,
    required this.fruits,
    required this.category,
  });

  final double width;
  final String fruits;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 3.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "فواكه",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    child: Image.asset(
                      fruits,
                      height: 50.h,
                      width: width * .3.w,
                      fit: BoxFit.fill,
                    )),
                Positioned(
                  left: 30,
                  bottom: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 27.r,
                    child: CircleAvatar(
                      backgroundColor: AppColors.orangeColor,
                      radius: 25.r,
                      child: Image.asset(category, height: 35.h),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}