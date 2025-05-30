import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'build_items.dart';

class FruitsItems extends StatelessWidget {
  const FruitsItems({super.key, required this.isPortrait});
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    String fruitsCategory = "assets/images/fruits_category.jpg";
    String category = "assets/images/category_icon.png";
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: isPortrait? height * .15 : height * .32,
      child: ListView.separated(
        padding: const EdgeInsets.only(right: 10.0, left: 10),
        itemBuilder: (context, index) => BuildItems(width: width, fruits: fruitsCategory, category: category),
        separatorBuilder: (context, index) => SizedBox(
          width: 10.w,
        ),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
