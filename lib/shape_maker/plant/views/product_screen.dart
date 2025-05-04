import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/const.dart';
import 'package:selaty/shape_maker/plant/json_file/plant_items_json.dart';
import 'package:selaty/shape_maker/plant/model/plant_model.dart';
import 'package:selaty/shape_maker/plant/views/plant_screen.dart';
import 'package:selaty/shape_maker/plant/widgets/corner_icons.dart';
import '../widgets/app_bar.dart';
import '../widgets/custom_painter.dart';
import '../widgets/plant_item.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<PlantModel> itemsList = plantsJson.map((e) => PlantModel.fromJson(e)).toList();
    return Scaffold(
      backgroundColor: AppColors.plantColor,
      appBar: const PlantAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: itemsList.length,
                    itemBuilder: (context,index) {
                      final item = itemsList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PlantScreen(
                                backGround: item.image ?? "",
                                text: item.text ?? "",
                                subtext: item.subtext ?? "",
                                number: item.number ?? "",
                              ),
                            ),
                          );
                        },
                        child: PlantItem(
                          image: itemsList[index].image??"",
                          text: itemsList[index].text??"",
                          subtext:itemsList[index].subtext??"",
                          number: itemsList[index].number??"",),
                      );
                    },
                  separatorBuilder: (context, index) => SizedBox(height: 10,),
                ),
              ],
            ),
          ),
          Positioned(
            right: 120,
            bottom: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(
                      130.w,
                      (130 * 0.25)
                          .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPS2CustomPainter(),
                ),
                Icon(
                  CupertinoIcons.bag_fill,
                  color: Colors.black,
                  size: 25.r,
                ),
              ],
            ),
          ),
           Padding(
             padding: EdgeInsets.only(bottom: 70.0.h),
             child: const CornerIcons(
              icon: Icons.arrow_back_ios_new,
              icon2: Icons.arrow_forward_ios_outlined,
          ),
           ),
        ],
      ),
    );
  }
}
