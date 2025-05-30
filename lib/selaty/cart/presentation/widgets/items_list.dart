import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'item_container.dart';
class ItemsList extends StatelessWidget {
  const ItemsList({
    super.key, required this.isPortrait,
  });
  final bool isPortrait ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 370.h,
        width: 330.w,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
            itemBuilder: (context,index) => ItemContainer(isPortrait: isPortrait,),
            separatorBuilder: (context,index) =>  SizedBox(height: 10.h,),
            itemCount: 10),
      ),
    );
  }
}