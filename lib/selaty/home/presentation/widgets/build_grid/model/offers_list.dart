import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../const.dart';
import '../offers_class.dart';

final List<Offers> offers = [
  Offers(
      title: 'عرض',
      centerFontSize: 20.sp,
      centerTitle: '30%',
      subtitle: "خصم",
      backgroundColor: AppColors.purpleColor),
  Offers(
      title: 'عرض',
      centerTitle: '40%',
      centerFontSize: 20.sp,
      subtitle: "خصم",
      backgroundColor: AppColors.blueColor),
  Offers(
      title: 'عرض',
      centerTitle: '50%',
      centerFontSize: 20.sp,
      subtitle: "خصم",
      backgroundColor: AppColors.redColor),
  Offers(
    title: 'اشترى 1 واحصل',
    centerTitle: 'على 1',
    centerFontSize: 12.sp,
    centerColor: Colors.white,
    subtitle: "مجانا",
    subtitleFontSize: 20.sp,
    centerFontWeight: FontWeight.normal,
    subFontWeight: FontWeight.bold,
    backgroundColor: AppColors.orangeColor,
  ),
  Offers(
      title: 'اقل', subtitle: 'SAR 99',
      subtitleFontSize: 20.sp,
      subtitleColor: Colors.black,
      subFontWeight: FontWeight.bold,
      backgroundColor: AppColors.oilColor),
  Offers(
      title: ' اختيارات \nالشهر',
      titleFontSize: 20.sp,
      backgroundColor: AppColors.lightBlueColor),
];