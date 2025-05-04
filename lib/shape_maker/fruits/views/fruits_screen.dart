import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/shape_maker/fruits/json_file/fruit_detail_json.dart';
import 'package:selaty/shape_maker/fruits/model/fruit_detail_model.dart';
import 'package:selaty/shape_maker/fruits/model/fruit_model.dart';
import 'package:selaty/shape_maker/fruits/views/fruit_details.dart';
import '../json_file/fruit_item_json.dart';
import '../widgets/fruit_item.dart';
import '../widgets/navigation_bar/nav_bar.dart';
import '../widgets/offers/offers_item.dart';
import '../widgets/top_bar/top_bar_items.dart';

class FruitsScreen extends StatelessWidget {
  const FruitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<FruitModel> fruitItemsList = fruitsJson.map((e) => FruitModel.fromJson(e)).toList();
    List<FruitDetailsModel> fruitList = fruitsDetailsJson.map((e) => FruitDetailsModel.fromJson(e)).toList();
    return Scaffold(
      backgroundColor: const Color(0xFF2a2b2e),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 5.0.h),
        child: const BottomNavBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBar(),
              SizedBox(
                height: 180.h,
                child: ListView.separated(
                  separatorBuilder: (context,index) => SizedBox(width: 15.w,),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: fruitList.length,
                  itemBuilder: (context,index){
                    final item = fruitList[index];
                    return GestureDetector(
                        onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FruitDetails(
                            fruit: item.image ?? "",
                            text: item.text ?? "",
                          ),
                        ),
                      );
                    },
                    child: FruitItem(
                        image: fruitItemsList[index].image??"",
                        text: fruitItemsList[index].text??"",
                        label: fruitItemsList[index].label??"",
                        subtext: fruitItemsList[index].subtext??"",),);
                  },
                ),
              ),
              const FruitOffers(),
            ],
          ),
        ),
      ),
    );
  }
}


