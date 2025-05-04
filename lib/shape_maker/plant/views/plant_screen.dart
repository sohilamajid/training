import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/bottom_shape.dart';
import '../widgets/corner_icons.dart';
import '../widgets/item_view.dart';
import '../widgets/shape_number.dart';

class PlantScreen extends StatelessWidget {
  const PlantScreen({
    super.key,
    required this.backGround,
    required this.text,
    required this.subtext,
    required this.number,
  });

  final String backGround;
  final String text;
  final String subtext;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: const Color(0xFF146a0c)),
          Positioned(
            right: 80,
            bottom: 50,
            child: Icon(Icons.minimize, color: Colors.black, size: 40.r),
          ),
          Positioned(
            left: 80,
            bottom: 40,
            child: Icon(Icons.add, color: Colors.black, size: 40.r),
          ),
          const BottomShape(),
          const CornerIcons(),
          Positioned(
            bottom: 105,
            left: 110,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(180, 180 * 0.375),
                  painter: RPS3CustomPainter(),
                ),
                Text(number,
                    style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          ItemView(backGround: backGround,text: text,subtext: subtext),
        ],
      ),
    );
  }
}
