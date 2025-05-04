import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selaty/selaty/splash/presentation/views/splash_screen_body.dart';
import '../../../onboarding/page_view_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) =>
    Get.offAll(() => const PageViewScreen()),);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}


// if((onBoarding ?? false) == false ){
//   onBoarding
// }else{
//   if(isLogin){
//     home
// }else{login}
// }