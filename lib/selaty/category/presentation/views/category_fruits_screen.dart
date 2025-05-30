import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../home/presentation/widgets/home_search_bar.dart';
import '../../../profile/presentation/widgets/appBar/profile_appBar.dart';
import '../widgets/category_items.dart';
import '../widgets/fruit_image.dart';
import '../../../../const.dart';

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
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
        return OrientationBuilder(builder: (context, orientation){
          bool isPortrait = orientation == Orientation.portrait;
          return SingleChildScrollView(
            child: Column(
              children: [
                FruitImage(fruitIcon: fruitIcon),
                Padding(
                  padding: EdgeInsets.only(left: 10.0.w,top: 10.h),
                  child: HomeSearchBar(isPortrait: isPortrait,),
                ),
                CategoryItems(height: height, fruits: fruits, width: width,isPortrait: isPortrait,),
              ],
            ),
          );
        });
      })
    );
  }
}
