import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../const.dart';
import '../../../delivery/presentation/views/delivery_screen.dart';
import '../../../profile/presentation/widgets/appBar/profile_appBar.dart';
import '../../../shared_widgets/custom_button/custom_button.dart';
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
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
        return OrientationBuilder(builder: (context, orientation){
          bool isPortrait = orientation == Orientation.portrait;
          return Center(
            child: CartStates(
              isPortrait: isPortrait,
              width: width,
              height: height,
              containerColor: AppColors.greenColor,
              imagePath: successBagIcon,
              title: 'طلبك ناجح !',
              subtitle: "شكرا على الطلب ..ستحصل عليه في خلال بضع دقائق",
              button: InkWell(
                onTap: () => Get.to(const DeliveryScreen()),
                child: CustomButton(
                    text: "ترتيب المسار", color: const Color(0xFF38344b), width: 320.w),
              ),
            ),
          );
        });
      }),
    );
  }
}
