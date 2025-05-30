import 'package:flutter/material.dart';
import 'package:selaty/selaty/home/presentation/widgets/home_app_bar.dart';
import '../widgets/layout/home_landscape.dart';
import '../widgets/layout/home_portrait.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String arrow = "assets/images/arrow.png";
  String fruits = "assets/images/fruits.png";
  String fruitImage = "assets/images/fruits_img.jpg";
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            bool isPortrait = orientation == Orientation.portrait;
            return Scaffold(
              backgroundColor: const Color(0xFFe2e2e2),
              appBar: HomeAppBar(isPortrait: isPortrait),
              body:
                  isPortrait
                      ? HomePortrait(
                        arrow: arrow,
                        fruitImage: fruitImage,
                        isPortrait: isPortrait,
                      )
                      : HomeLandscape(
                        isPortrait: isPortrait,
                        arrow: arrow,
                        fruitImage: fruitImage,
                      ),
            );
          },
        );
      },
    );
  }
}
