import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class FruitsBanner extends StatelessWidget {
  const FruitsBanner({super.key, required this.isPortrait});
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    String fruits = "assets/images/fruits_category.jpg";
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: isPortrait? height * .15 : height * .30,
      child: ListView.separated(
        padding: const EdgeInsets.only(right: 10.0,left: 10),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            fruits,
            fit: BoxFit.fill,
            width: isPortrait? width* .7 : width *.5,
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
