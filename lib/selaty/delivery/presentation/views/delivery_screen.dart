import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const.dart';
import '../../../profile/presentation/widgets/appBar/profile_appBar.dart';
import '../widgets/first_container.dart';
import '../widgets/icons_line.dart';
import '../widgets/item_text.dart';
class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: const SharedAppBar(isCenter: true,title: "ترتيب المسار"),
      body: Column(
        children: [
          const FirstContainer(),
          Container(
            padding: EdgeInsets.only(top: 20.h,right: 25.w,left: 20.h),
            margin: EdgeInsets.only(top: 15.h,left: 15.w),
            width: 330.w,
            height: 390.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ItemText(title: "تم الطلب"),
                    SizedBox(height: 20.h,),
                    const ItemText(title: "Order"),
                    SizedBox(height: 20.h,),
                    const ItemText(title: "تم شحن الطلب"),
                    SizedBox(height: 20.h,),
                    const ItemText(title: "خارج الخدمة"),
                    SizedBox(height: 20.h,),
                    const ItemText(title: "الخروج للتوصيل"),
                  ],
                ),
                const Spacer(),
                const Column(
                  children: [
                    IconsLine(icon: Icons.list_alt),
                    IconsLine(icon: Icons.list),
                    IconsLine(icon: Icons.list),
                    IconsLine(icon: Icons.list),
                    IconsLine(icon: Icons.check_circle),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
