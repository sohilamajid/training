import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class FruitsBanner extends StatelessWidget {
  const FruitsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    String fruits = "assets/images/fruits_category.jpg";
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height * .15,
      child: ListView.separated(
        padding: const EdgeInsets.only(right: 10.0,left: 10),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            fruits,
            fit: BoxFit.fill,
            width: width* .7,
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 10.w,
        ),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
