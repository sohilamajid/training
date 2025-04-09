import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFed3d4d),
          ),
          child: const Icon(CupertinoIcons.slider_horizontal_3,color: Colors.white,size: 34,),
        ),
        SizedBox(width: 13.w,),
        Container(
          height: 50.h,
          width: width * .78,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 15.w,),
              const FaIcon(FontAwesomeIcons.close,color: Colors.black,size: 13,),
              SizedBox(width: 15.w,),
              Text("البحث عن المنتجات...",style: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
              ),),
              SizedBox(width: width * .24.w,),
              const Icon(Icons.search,color: Colors.grey,size: 27,),
            ],
          ),
        ),
      ],
    );
  }
}
