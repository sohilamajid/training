import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../home/presentation/widgets/items/build_items.dart';
import '../../../profile/presentation/widgets/appBar/profile_appBar.dart';
import 'category_fruits_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String logo = "assets/images/logo.png";
  String fruitsCategory = "assets/images/fruits_category.jpg";
  String category = "assets/images/category_icon.png";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color(0xFFe2e2e2),
      appBar: const SharedAppBar(isCenter: true, title: "التصنيفات"),
      // bottomNavigationBar: CustomNavigationBar(logo: logo),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0,right: 20,left: 20),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 15.0,
            mainAxisExtent: 150,
          ),
          itemCount: 10,
          itemBuilder: (context, index) => InkWell(
            child: BuildItems(
                width: width, fruits: fruitsCategory, category: category),
            onTap: () => Get.to(const CategoryFruitScreen()),
          ),
        ),
      ),
    );
  }
}
