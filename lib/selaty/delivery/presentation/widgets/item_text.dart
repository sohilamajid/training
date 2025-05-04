import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../const.dart';
class ItemText extends StatefulWidget {
  final String title ;
  const ItemText({
    super.key, required this.title,
  });

  @override
  State<ItemText> createState() => _ItemTextState();
}

class _ItemTextState extends State<ItemText> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
            color: isSelected ? AppColors.greenColor : Colors.black,
          ),),
          Text(isSelected ? "٢٦ مارس ٢٠٢٥" :"قيد الانتظار",
            style: TextStyle(
            fontSize: 13.sp,
            color: Colors.grey,
          ),),
        ],
      ),
    );
  }
  String _getFormattedDate() {
    return DateFormat('d MMMM y','ar').format(DateTime.now());
  }
}