import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../const.dart';
import '../../../cart_logo/presentation/views/cart_empty.dart';
import '../../../profile/presentation/widgets/appBar/profile_appBar.dart';
import '../../../shared_widgets/custom_button/custom_button.dart';
import '../widgets/bottom_container.dart';
import '../widgets/items_list.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: const SharedAppBar(isCenter: true, title: "عربة التسوق"),
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
        return OrientationBuilder(builder: (context, orientation){
          bool isPortrait = orientation == Orientation.portrait;
          return Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ItemsList(isPortrait: isPortrait,),
                  SizedBox(height: 15.h,),
                  BottomContainer(isPortrait: isPortrait,),
                  SizedBox(height: 8.h,),
                  InkWell(
                      onTap: () => Get.to(const CartEmpty()),
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0.h,bottom: 13.h),
                        child: CustomButton(text: "الدفع", color: AppColors.greenColor , width: 370.w),
                      )),
                ],
              ),
            ),
          );
        });
      }),
    );
  }
}
