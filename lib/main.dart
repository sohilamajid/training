import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:selaty/selaty/fire_base/fire_base_class.dart';
import 'package:selaty/selaty/home/presentation/views/home_screen.dart';
import 'package:selaty/selaty/shared_widgets/custom_navigation_bar.dart';
import 'package:selaty/shape_maker/fruits/views/fruits_screen.dart';
import 'package:selaty/shape_maker/plant/views/product_screen.dart';
import 'firebase_options.dart';
import 'selaty/splash/presentation/views/splash_screen.dart';


final navigatiorKey = GlobalKey<NavigatorState>();

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  await FirebaseApi().initNotifications();


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
            navigatorKey: navigatiorKey,
            debugShowCheckedModeBanner: false,
            home: CustomNavigationBar(logo: logo),
            routes: {
              CustomNavigationBar.route: (context) {
                final RemoteMessage? message = ModalRoute.of(context)?.settings.arguments as RemoteMessage?;
                return CustomNavigationBar(
                  logo: logo,
                  message: message,
                );
              },
            },
          );
        }
    );
  }
}
