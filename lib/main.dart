import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:training/selaty/cart/presentation/views/cart_screen.dart';
import 'package:training/selaty/cart_logo/presentation/views/cart_empty.dart';
import 'package:training/selaty/cart_logo/presentation/views/cart_success.dart';
import 'package:training/selaty/category/presentation/views/category_fruits_screen.dart';
import 'package:training/selaty/category/presentation/views/category_screen.dart';
import 'package:training/selaty/profile/presentation/views/profile_screen.dart';
import 'package:training/selaty/shared_widgets/custom_navigation_bar.dart';
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
    String logo = "assets/images/logo.png";
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_ , child) {
          return GetMaterialApp(
            theme: ThemeData(
                fontFamily: 'Cairo',
            ),
            locale: const Locale("ar"),
            debugShowCheckedModeBanner: false,
            home: const CartSuccess(),
          );
        }
    );
  }
}
