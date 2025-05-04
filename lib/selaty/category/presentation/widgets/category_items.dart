import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../cart/presentation/views/cart_screen.dart';
import '../../../home/presentation/widgets/fruits_new/items_bottom_row.dart';
import '../../../home/presentation/widgets/fruits_new/items_center_column.dart';
import '../../../home/presentation/widgets/fruits_new/items_row.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    super.key,
    required this.height,
    required this.fruits,
    required this.width,
  });

  final double height;
  final String fruits;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0,right: 20,left: 20),
      child: SizedBox(
        height: height * .55,
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 20.0,
            childAspectRatio: 1 / 2,
          ),
          itemCount: 10,
          itemBuilder: (context, index) => InkWell(
            onTap: () => Get.to(const CartScreen()),
            child: Stack(
              children: [
                Container(
                  // margin: EdgeInsets.only(bottom: 40.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ItemsRow(),
                        Center(
                          child: SizedBox(
                            height: 120.h,
                            width: 120.h,
                            child: Image.asset(fruits),
                          ),
                        ),
                        const CenterColumn(),
                      ],
                    ),
                  ),
                ),
                BottomRow(width: width),
              ],
            ),
          ),
        ),
      ),
    );
  }
}