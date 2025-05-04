import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const.dart';

class AddressCard extends StatefulWidget {
  final bool isSelected;
  final VoidCallback onSelect;
  const AddressCard(
      {super.key, required this.isSelected, required this.onSelect});

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  // bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 330.w,
          height: 180.h,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        if (widget.isSelected) ...[
          Positioned(
            top: 10,
            right: 35,
            child: Container(
              width: 50.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: AppColors.greenColor.withOpacity(.2),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Center(
                child: Text("افتراضي",
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.greenColor,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ),
        ],
        Padding(
          padding: EdgeInsets.only(top: 35.0.h, right: 30.w, left: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Transform.scale(
                    scale: 1.4,
                    child: Radio<bool>(
                      value: true,
                      groupValue: widget.isSelected,
                      onChanged: (_) => widget.onSelect(),
                      activeColor: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "المنزل",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.more_horiz,
                    size: 27.r,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "شارع 2 --- شبين الكوم - المنوفية",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              Text(
                "الجوال: 050308821",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
