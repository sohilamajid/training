import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const.dart';

class DescriptionText extends StatelessWidget {
  final String text ;
  const DescriptionText({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 150,
      left: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Exotic fruits",
            style: TextStyle(
                color: Colors.white,
                fontSize: 40.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              height: 0.8, //controls height between text
              fontSize: 40.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 175.w,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: BorderSide(color: AppColors.fruitGreenColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {},
                child: Text('Nutrition',
                    style: TextStyle(
                        color: AppColors.fruitGreenColor,
                      fontSize: 18.sp,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}