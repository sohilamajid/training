import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../category/presentation/views/category_screen.dart';


class CustomTitle extends StatelessWidget {
  final String mainTitle;
  final String? secondaryTitle;
  final String? trailingText;
  final String? arrowIcon;
  final FontWeight? fontWeight;

  const CustomTitle({
    super.key,
    required this.mainTitle,
    this.secondaryTitle,
    this.trailingText,
    this.arrowIcon,
    this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0,left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(mainTitle,style: TextStyle(
            fontSize: 17.sp,
            fontWeight: fontWeight,
          ),),
          SizedBox(width: 5.w,),
          Text(secondaryTitle?? "",style: TextStyle(
            fontSize: 13.sp,
            color: Colors.grey,
          ),),
          const Spacer(),
          arrowIcon != null
          ? Image.asset(arrowIcon!,width: 15.w,color: Colors.grey.shade500,): const SizedBox.shrink(),
          SizedBox(width: 5.w,),
          InkWell(
            onTap: () => Get.to(const CategoryScreen()),
            child: Text(trailingText?? "",style: TextStyle(
              fontSize: 13.sp,
              color: Colors.grey,
            ),),
          ),
        ],
      ),
    );
  }
}
