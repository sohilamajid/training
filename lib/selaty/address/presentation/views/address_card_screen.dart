import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../const.dart';
import '../../../cart_logo/presentation/views/cart_success.dart';
import '../../../profile/presentation/widgets/appBar/profile_appBar.dart';
import '../../../shared_widgets/custom_button/custom_button.dart';
import '../widgets/address_card_widget.dart';


class AddressCardScreen extends StatefulWidget {
  const AddressCardScreen({super.key});

  @override
  State<AddressCardScreen> createState() => _AddressCardScreenState();
}

class _AddressCardScreenState extends State<AddressCardScreen> {
  int? selectedIndex ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: const SharedAppBar(title: "عنوان التسليم", isCenter: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 23.w),
            child: Text(
              "يشحن الى",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.sp,
              ),
            ),
          ),
          SizedBox(
            height: 480.h,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => AddressCard(
                  isSelected: selectedIndex == index,
                  onSelect: () => selectedAddress(index),
                ),
                itemCount: 10),
          ),
          SizedBox(
            height: 10.h,
          ),
          Center(
              child: InkWell(
                onTap: () => Get.to(const CartSuccess()),
                child: CustomButton(
                    text: "التسليم لهذا العنوان",
                    color: AppColors.greenColor,
                    width: 370.w),
              ))
        ],
      ),
    );
  }
  void selectedAddress(int index){
    setState(() {
      if(selectedIndex == index){
        selectedIndex = null ;
      }else{
        selectedIndex = index ;
      }
    });
  }
}
