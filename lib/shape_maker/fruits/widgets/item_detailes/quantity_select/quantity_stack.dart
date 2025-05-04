import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/shape_maker/fruits/widgets/item_detailes/quantity_select/quantity_circle.dart';
import 'package:selaty/shape_maker/fruits/widgets/item_detailes/quantity_select/shape_circle.dart';
class QuantityStack extends StatefulWidget {
  const QuantityStack({super.key});

  @override
  State<QuantityStack> createState() => _QuantityStackState();
}
class _QuantityStackState extends State<QuantityStack> {
  int? selectedIndex;
  String getPrice() {
    switch (selectedIndex) {
      case 0:
        return "£10";
      case 1:
        return "£24.5";
      case 2:
        return "£45";
      default:
        return "£0";
    }
  }
  String getPackText() {
    switch (selectedIndex) {
      case 0:
        return "1 pack";
      case 1:
        return "5 pack";
      case 2:
        return "10 pack";
      default:
        return "Select a quantity";
    }
  }
  void selectCircle(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -40,
          bottom: -40,
          child: Container(
            width: 210.r,
            height: 210.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
            ),
          ),
        ),
        QuantityCircle(left: 70,bottom: 165,text: "1",isSelected: selectedIndex == 0,
          onTap: () => selectCircle(0),),
        QuantityCircle(left: 150,bottom: 120,text: "5",subtext: "pack",isSelected: selectedIndex == 1,
          onTap: () => selectCircle(1), ),
        QuantityCircle(left: 165,bottom: 30,text: "10",subtext: "pack",isSelected: selectedIndex == 2,
          onTap: () => selectCircle(2), ),
        if (selectedIndex != null) ...[
          Positioned(
            left: selectedIndex == 0 ? 50 : selectedIndex == 1 ? 105 : 120,
            bottom: selectedIndex == 0 ? 150 : selectedIndex == 1 ? 107 : 30,
            child: Transform.rotate(
              angle: selectedIndex == 0 ? 90 : selectedIndex == 1 ? 100 : 50,
              child: CustomPaint(
                size: Size(60, (60 * 0.375).toDouble()),
                painter: RPSCustomPainter(),
              ),
            ),
          ),
        ],
        Positioned(
          left: -30,
          bottom: -30,
          child: CircleAvatar(
            radius: 80.r,
            backgroundColor: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(getPrice(),style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                    color: Colors.black
                ),),
                Text(getPackText(),style: TextStyle(
                    height: .8,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Colors.black
                ),),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
