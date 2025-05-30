import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'offers_class.dart';

class GridUI extends StatelessWidget {
  const GridUI({
    super.key,
    required this.offer,
  });

  final Offers offer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: offer.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              offer.title,
              style: TextStyle(
                fontSize: min(offer.titleFontSize?.sp ?? 14.sp, 25),
                color: Colors.white,
                // fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
            if (offer.centerTitle != null)
              Text(
                offer.centerTitle!,
                style: TextStyle(
                  fontSize: min(offer.centerFontSize?.sp ?? 18.sp, 30),
                  color: offer.centerColor ?? Colors.black,
                  fontWeight: offer.centerFontWeight ?? FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            if (offer.subtitle != null)
              Text(
                offer.subtitle!,
                style: TextStyle(
                  fontSize: min(offer.subtitleFontSize?.sp ?? 14.sp,25),
                  color: offer.subtitleColor ?? Colors.white,
                  fontWeight: offer.subFontWeight ?? FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}