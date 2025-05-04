import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../const.dart';
import '../widgets/item_detailes/cart_container.dart';
import '../widgets/item_detailes/description.dart';
import '../widgets/item_detailes/fruit_image.dart';
import '../widgets/item_detailes/quantity_select/quantity_stack.dart';
import '../widgets/item_detailes/top_items.dart';

class FruitDetails extends StatefulWidget {
  final String fruit;
  final String text;

  const FruitDetails({super.key, required this.fruit, required this.text});

  @override
  State<FruitDetails> createState() => _FruitDetailsState();
}

class _FruitDetailsState extends State<FruitDetails> {

  @override
  Widget build(BuildContext context) {
    String background = "assets/images/stoneBackground.jpg";
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            background,
            fit: BoxFit.cover,
            width: width,
            height: height,
          ),
          const TopItems(),
          FruitImage(height: height, width: width, backgroundFruit: widget.fruit),
          DescriptionText(text: widget.text),
          Padding(
            padding: EdgeInsets.only(top: 260.0.h, left: 20.w),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.fruitGreenColor,
                    radius: 6.r,
                  ),
                  Text(
                    "   SELECT\n  QUANTITY",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const CartContainer(),
          const QuantityStack(),
        ],
      ),
    );
  }
}





