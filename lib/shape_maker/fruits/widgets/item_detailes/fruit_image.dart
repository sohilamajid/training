import 'package:flutter/material.dart';
class FruitImage extends StatelessWidget {
  const FruitImage({
    super.key,
    required this.height,
    required this.width,
    required this.backgroundFruit,
  });

  final double height;
  final double width;
  final String backgroundFruit;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70,
      right: -120,
      child: Container(
        height: height * 1,
        width: width * .95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(backgroundFruit),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}