import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/selaty/splash/presentation/widgets/splash_loader.dart';
import 'package:selaty/selaty/splash/presentation/widgets/splash_logo.dart';
import 'package:selaty/selaty/splash/presentation/widgets/splash_title.dart';
import '../../../shared_widgets/back_ground/back_ground_image.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}
class _SplashBodyState extends State<SplashBody> {
  String logo = "assets/images/logo.png";
  String loading = "assets/images/loading.gif";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              bool isPortrait = orientation == Orientation.portrait;
              return Stack(
                fit: StackFit.expand,
                children: [
                  BuildBackGround(isPortrait: isPortrait, logo: logo),
                  Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                      child: Flex(
                        direction: isPortrait ? Axis.vertical : Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SplashLogo(imagePath: logo),
                          SizedBox(width: isPortrait ? 0 : 20.w),
                          SplashTitle(isPortrait: isPortrait),
                          SizedBox(
                              height: isPortrait ? 40.h : 0,
                              width: isPortrait ? 0 : 20.w),
                          SplashLoader(imagePath: loading),
                        ],
                      ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
