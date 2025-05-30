import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const.dart';

class LastFruitItems extends StatelessWidget {
  const LastFruitItems({super.key, required this.isPortrait});
  final bool isPortrait ;

  @override
  Widget build(BuildContext context) {
    String fruits = "assets/images/fruits.png";
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: isPortrait? height * .35 : height * .75,
      child: ListView.separated(
          itemBuilder: (context , index) => Stack(
            children: [
              Container(
                width: isPortrait? 160.w : 100.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("طبق فواكه",style: TextStyle(
                        fontSize: isPortrait? 16.sp : 12.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text("خصم 25% بدون فوائد",style: TextStyle(
                        fontSize: isPortrait ? 13.sp : 8.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),),
                      Center(
                        child: SizedBox(
                          height: 130.h,
                          width: 130.h,
                          child: Image.asset(fruits),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: width * .55,
                      height: 35.h,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: AppColors.greyColor,
                      ),
                    ),
                    Positioned(
                      bottom: 18,
                      right: 15,
                      child: CircleAvatar(
                        backgroundColor: AppColors.redColor,
                        child: Transform.rotate(
                          angle: 3.14,
                          child: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,size: 16,),
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          separatorBuilder: (context, index) => SizedBox(
      width: 10.w,
    ),
          scrollDirection: Axis.horizontal,
          itemCount: 10),
    );
  }
}
