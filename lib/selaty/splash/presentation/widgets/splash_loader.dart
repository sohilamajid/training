import 'package:flutter/material.dart';
import 'package:selaty/const.dart';
class SplashLoader extends StatelessWidget {
  final String imagePath;

  const SplashLoader({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return
      CircularProgressIndicator(
        color: AppColors.greenColor,
      );
  }
}
