import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training/const.dart';
import 'package:training/selaty/home/presentation/widgets/home_search_bar.dart';
import '../../../profile/presentation/widgets/appBar/profile_appBar.dart';
import '../../../shared_widgets/custom_navigation_bar.dart';
import '../widgets/category_items.dart';
import '../widgets/fruit_image.dart';

class CategoryFruitScreen extends StatefulWidget {
  const CategoryFruitScreen({super.key});

  @override
  State<CategoryFruitScreen> createState() => _CategoryFruitScreenState();
}

class _CategoryFruitScreenState extends State<CategoryFruitScreen> {
  String logo = "assets/images/logo.png";
  String fruitIcon = "assets/images/fruit_icon.png";
  String fruits = "assets/images/fruits.png";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: const Color(0xFFe2e2e2),
      appBar: SharedAppBar(isCenter: true, title: "الفاكهة",backgroundColor: AppColors.greenColor,color: Colors.white,),
      // bottomNavigationBar: CustomNavigationBar(logo: logo),
      body: Column(
        children: [
          FruitImage(fruitIcon: fruitIcon),
          Padding(
            padding: EdgeInsets.only(left: 10.0.w,top: 10.h),
            child: const HomeSearchBar(),
          ),
          CategoryItems(height: height, fruits: fruits, width: width),
        ],
      ),
    );
  }
}
