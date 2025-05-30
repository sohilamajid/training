import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'grid_ui.dart';
import 'model/offers_list.dart';

class GridSquares extends StatelessWidget {
  const GridSquares({super.key, required this.isPortrait});
  final bool isPortrait ;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Directionality(
      textDirection: TextDirection.rtl, // Ensure RTL layout
      child: SizedBox(
        height: isPortrait ? 235.h : 420.h,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: offers.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isPortrait ? 3 : 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final offer = offers[index];
            return GridUI(offer: offer);
          },
        ),
      ),
    );
  }
}
