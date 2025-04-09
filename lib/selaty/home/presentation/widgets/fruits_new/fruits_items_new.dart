import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'items_bottom_row.dart';
import 'items_center_column.dart';
import 'items_row.dart';

class FruitsItemsNew extends StatelessWidget {
  const FruitsItemsNew({super.key});

  @override
  Widget build(BuildContext context) {
    String fruits = "assets/images/fruits.png";
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height * .85,
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 20.0,
            childAspectRatio: 1.5 / 1),
        itemBuilder: (context, index) => Stack(
          children: [
            Container(
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
        itemCount: 10,
      ),
    );
  }
}
