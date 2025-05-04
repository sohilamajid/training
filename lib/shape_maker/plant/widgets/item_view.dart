import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ItemView extends StatelessWidget {
  const ItemView({
    super.key,
    required this.backGround, required this.text, required this.subtext,
  });

  final String backGround;
  final String text ;
  final String subtext ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 550.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(185),
            bottomRight: Radius.circular(185),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
                height: 400.h,
                width: 400.h,
                child: Image.asset(backGround)),
            Text(
              text,
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Bird of Paradise",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                )),
            Text(subtext,
                style: TextStyle(
                    fontSize: 30.sp, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}