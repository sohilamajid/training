import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:training/selaty/onboarding/page_view_screen.dart';
import 'package:training/selaty/verification/change_password_screen.dart';
import 'package:training/selaty/verification/key_screen.dart';
import 'package:training/selaty/verification/otp_screen.dart';
import 'package:training/selaty/verification/verification_screen.dart';
import 'selaty/onboarding/onboarding_screen.dart';
import 'selaty/splash/presentation/views/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_ , child) {
          return GetMaterialApp(
            theme: ThemeData(
                fontFamily: 'Cairo',
            ),
            locale: Locale("en"),
            debugShowCheckedModeBanner: false,
            home: PageViewScreen(),
          );
        }
    );
  }
}
