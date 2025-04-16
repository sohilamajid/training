import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training/const.dart';
import 'package:training/selaty/profile/presentation/widgets/appBar/profile_appBar.dart';
import 'package:training/selaty/shared_widgets/custom_button/custom_button.dart';

import '../widgets/cart_states.dart';

class CartEmpty extends StatefulWidget {
  const CartEmpty({super.key});

  @override
  State<CartEmpty> createState() => _CartEmptyState();
}

class _CartEmptyState extends State<CartEmpty> {
  String bagIcon = "assets/images/bag_icon.png";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: const SharedAppBar(isCenter: true, title: "عربة التسوق"),
      body: Center(
        child: CartStates(
          width: width,
          height: height,
          imagePath: bagIcon,
          title: 'عربة التسوق فارغة !',
          titleColor: Colors.black,
          imageColor: Colors.red,
          subtitle: "اجعل سلتك سعيدة وأضف منتجات",
          subtitleColor: Colors.grey,
          button: CustomButton(
              text: "ابدأ التسوق", color: AppColors.greenColor, width: 320.w),
        ),
      ),
    );
  }
}
