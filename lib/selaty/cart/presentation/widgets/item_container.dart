import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../const.dart';
class ItemContainer extends StatefulWidget {
  const ItemContainer({
    super.key,
  });

  @override
  State<ItemContainer> createState() => _ItemContainerState();
}

class _ItemContainerState extends State<ItemContainer> {
  int count = 1;
  void addCounter(){
    count++ ;
    setState(() {

    });
  }
  void subCounter(){
    count-- ;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0,right: 13),
            child: Column(
              children: [
                InkWell(
                    onTap: () {
                      addCounter();
                    },
                    child:
                    Icon(Icons.add,color: Colors.black,size: 23.r,)
                ),
                SizedBox(height: 10.h,),
                Text("$count",style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),),
                InkWell(
                  onTap: () {
                    subCounter();
                  },
                    child: Icon(Icons.minimize,color: Colors.black,size: 23.r,)),
              ],
            ),
          ),
          SizedBox(width: 85.w,),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("35.00\$x1",style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.greenColor,
                ),),
                Text("كمثرى امريكي",style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
                Text("1 kg",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}