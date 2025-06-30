import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selaty/selaty/auth/views/auth_screen.dart';
import 'package:selaty/selaty/splash/presentation/views/splash_screen_body.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../onboarding/page_view_screen.dart';
import '../../../shared_widgets/custom_navigation_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 4)).then((value) =>
    // Get.offAll(() => const PageViewScreen()),);
    _navigateAfterSplash();
    super.initState();
  }

  void _navigateAfterSplash() async {
    await Future.delayed(const Duration(seconds: 3)); // splash delay

    final prefs = await SharedPreferences.getInstance();

    // check if onboarding was shown
    final bool? onBoardingSeen = prefs.getBool("onBoarding");

    if (onBoardingSeen == null || onBoardingSeen == false) {
      // First time => show onboarding
      Get.offAll(() => const PageViewScreen());
    } else {
      // Already seen onboarding => check token
      final token = prefs.getString("token");
      if (token != null && token.isNotEmpty) {
        Get.offAllNamed(CustomNavigationBar.route);
      } else {
        Get.offAll(AuthScreen());
      }
    }
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