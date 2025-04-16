import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training/const.dart';
import 'package:training/selaty/profile/presentation/widgets/appBar/profile_appBar.dart';
import 'package:training/selaty/shared_widgets/custom_button/custom_button.dart';
import '../widgets/cart_states.dart';

class CartSuccess extends StatefulWidget {
  const CartSuccess({super.key});

  @override
  State<CartSuccess> createState() => _CartSuccessState();
}

class _CartSuccessState extends State<CartSuccess> {
  String successBagIcon = "assets/images/success_bag_icon.png";
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
          containerColor: AppColors.greenColor,
          imagePath: successBagIcon,
          title: 'طلبك ناجح !',
          subtitle: "شكرا على الطلب ..ستحصل عليه في خلال بضع دقائق",
          button: CustomButton(
              text: "ترتيب المسار", color: const Color(0xFF38344b), width: 320.w),
        ),
      ),
    );
  }
}
