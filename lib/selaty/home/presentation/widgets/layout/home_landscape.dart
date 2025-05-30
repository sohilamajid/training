import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/selaty/home/presentation/widgets/custom_title.dart';
import 'package:selaty/selaty/home/presentation/widgets/fruits_banner.dart';
import 'package:selaty/selaty/home/presentation/widgets/items/fruits_items.dart';
import 'package:selaty/selaty/home/presentation/widgets/home_search_bar.dart';
import '../build_grid/grid_squares.dart';
import '../fruits_new/fruits_items_new.dart';
import '../last_fruit_items.dart';

class HomeLandscape extends StatelessWidget {
  const HomeLandscape({
    super.key,
    required this.isPortrait,
    required this.arrow,
    required this.fruitImage,
  });

  final bool isPortrait;
  final String arrow;
  final String fruitImage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 13.0, left: 10),
            child: HomeSearchBar(isPortrait: isPortrait,),
          ),
          SizedBox(height: 20.h),
          CustomTitle(
            mainTitle: "القيمة الافضل",
            secondaryTitle: "اعلى المبيعات",
            trailingText: "مشاهدة الكل",
            arrowIcon: arrow,
            isPortrait: isPortrait,
          ),
          SizedBox(height: 10.h),
          FruitsBanner(isPortrait: isPortrait,),
          SizedBox(height: 10.h),
          CustomTitle(
            mainTitle: "التصنيفات",
            trailingText: "مشاهدة الكل",
            arrowIcon: arrow,
            isPortrait: isPortrait,
          ),
          SizedBox(height: 10.h),
          FruitsItems(isPortrait: isPortrait,),
          SizedBox(height: 10.h),
          CustomTitle(
            mainTitle: "الأكثر مبيعا",
            fontWeight: FontWeight.bold,
            trailingText: "مشاهدة الكل",
            arrowIcon: arrow,
            isPortrait: isPortrait,
          ),
          SizedBox(height: 10.h),
          FruitsItemsNew(isPortrait: isPortrait,),
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 180.h,
                width: double.infinity,
                child: Image.asset(
                  fruitImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          CustomTitle(
            mainTitle: "تسوق حسب العروض",
            fontWeight: FontWeight.bold,
            trailingText: "مشاهدة الكل",
            arrowIcon: arrow,
            isPortrait: isPortrait,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0,right: 25,left: 25),
            child: GridSquares(isPortrait: isPortrait,),
          ),
          CustomTitle(
            mainTitle: "طازج وسريع", fontWeight: FontWeight.bold,isPortrait: isPortrait,),
          SizedBox(height: 10.h),
          FruitsItemsNew(isPortrait: isPortrait,),
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 180.h,
                width: double.infinity,
                child: Image.asset(
                  fruitImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          CustomTitle(
            mainTitle: "انتهز الفرصة",
            fontWeight: FontWeight.bold,
            trailingText: "مشاهدة الكل",
            arrowIcon: arrow,
            isPortrait: isPortrait,
          ),
          SizedBox(height: 5.h),
          LastFruitItems(isPortrait: isPortrait,),
        ],
      ),
    );
  }
}