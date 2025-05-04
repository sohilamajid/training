import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'price_column.dart';
import '../../../../const.dart';
import 'fruit_column.dart';
import 'offers_text.dart';

class FruitOffers extends StatelessWidget {
  const FruitOffers({super.key});

  @override
  Widget build(BuildContext context) {
    String guavaFruit = "assets/images/guava.png";
    return Column(
      children: [
        const OffersRow(),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0.w),
              child: Container(
                width: 300.w,
                height: 90.h,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: AppColors.fruitGreyColor,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 120.w,
                      height: 120.h,
                      child: Image.asset(guavaFruit),
                    ),
                    const FruitColumn(),
                    SizedBox(width: 10.w,),
                    const PriceColumn(),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 15.r,
                backgroundColor: Colors.white,
                child: const Icon(Icons.arrow_forward,color: Colors.black,),
              ),
            ),
          ],
        ),
      ],
    );
  }
}



