import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/shape_maker/plant/widgets/plant_items_column.dart';
import 'item_shape.dart';

class PlantItem extends StatelessWidget {
  const PlantItem({
    super.key,
    required this.image,
    required this.text,
    required this.subtext,
    required this.number,
  });

  final String image;
  final String text;
  final String subtext;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 125.h,
      clipBehavior: Clip.hardEdge,//nothing outside container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 20),
               child: Image.asset(
                image,
                height: 300.h,
                width: 100.w,
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ItemsColumn(text: text, subtext: subtext, number: number),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Positioned(
                  right: -30.w,
                  child: Transform.rotate(
                    angle: -180.r,
                    child: CustomPaint(
                      size: Size(95.w, 95.w * 0.375),
                      painter: RPSCustomPainter(),
                    ),
                  ),
                ),
                Positioned(
                  right: 15.w,
                  top: 54.h,
                  child: Icon(
                    CupertinoIcons.bag_fill,
                    size: 13.r,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
