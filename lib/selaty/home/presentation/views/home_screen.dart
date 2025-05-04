import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/selaty/home/presentation/widgets/custom_title.dart';
import 'package:selaty/selaty/home/presentation/widgets/fruits_banner.dart';
import 'package:selaty/selaty/home/presentation/widgets/items/fruits_items.dart';
import 'package:selaty/selaty/home/presentation/widgets/home_app_bar.dart';
import 'package:selaty/selaty/home/presentation/widgets/home_search_bar.dart';
import '../widgets/fruits_new/fruits_items_new.dart';
import '../widgets/build_grid/grid_squares.dart';
import '../widgets/last_fruit_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String arrow = "assets/images/arrow.png";
  String fruits = "assets/images/fruits.png";
  String fruitImage = "assets/images/fruits_img.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe2e2e2),
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 13.0, left: 10),
              child: HomeSearchBar(),
            ),
            SizedBox(height: 20.h),
            CustomTitle(
                mainTitle: "القيمة الافضل",
                secondaryTitle: "اعلى المبيعات",
                trailingText: "مشاهدة الكل",
                arrowIcon: arrow),
            SizedBox(height: 10.h),
            const FruitsBanner(),
            SizedBox(height: 10.h),
            CustomTitle(
              mainTitle: "التصنيفات",
              trailingText: "مشاهدة الكل",
              arrowIcon: arrow,
            ),
            SizedBox(height: 10.h),
            const FruitsItems(),
            SizedBox(height: 10.h),
            CustomTitle(
              mainTitle: "الأكثر مبيعا",
              fontWeight: FontWeight.bold,
              trailingText: "مشاهدة الكل",
              arrowIcon: arrow,
            ),
            SizedBox(height: 10.h),
            const FruitsItemsNew(),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  fruitImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            CustomTitle(
              mainTitle: "تسوق حسب العروض",
              fontWeight: FontWeight.bold,
              trailingText: "مشاهدة الكل",
              arrowIcon: arrow,
            ),
            const GridSquares(),
            const CustomTitle(
                mainTitle: "طازج وسريع", fontWeight: FontWeight.bold),
            SizedBox(height: 10.h),
            const FruitsItemsNew(),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  fruitImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            CustomTitle(
              mainTitle: "انتهز الفرصة",
              fontWeight: FontWeight.bold,
              trailingText: "مشاهدة الكل",
              arrowIcon: arrow,
            ),
            SizedBox(height: 5.h),
            const LastFruitItems(),
          ],
        ),
      ),
    );
  }
}
