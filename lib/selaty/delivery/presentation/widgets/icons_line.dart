import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const.dart';
class IconsLine extends StatefulWidget {
  final IconData? icon ;
  const IconsLine({
    super.key, this.icon,
  });

  @override
  State<IconsLine> createState() => _IconsLineState();
}

class _IconsLineState extends State<IconsLine> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Column(
        children: [
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.greenColor.withOpacity(.4) : Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: Icon(
              widget.icon,
              color: isSelected ? AppColors.greenColor : Colors.grey,
              size: 28.r,
            ),
          ),
          Container(
            width: 4.w,
            height: 20.h,
            color: isSelected ? AppColors.greenColor : Colors.grey.shade400,
          ),
        ],
      ),
    );
  }
}