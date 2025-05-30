import 'package:flutter/material.dart';
import '../widgets/auth_land_layout.dart';
import '../widgets/auth_portrait_layout.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String backImage = "assets/images/logo.png";
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              bool isPortrait = orientation == Orientation.portrait;
              return isPortrait ? AuthPortraitLayout(isPortrait: isPortrait, backImage: backImage) :
              AuthLandLayout(isPortrait: isPortrait, backImage: backImage);
            },
          );
        },
      ),
    );
  }
}
