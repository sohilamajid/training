import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:selaty/selaty/fire_base/fire_base_class.dart';
import 'package:selaty/selaty/shared_widgets/custom_navigation_bar.dart';
import 'firebase_options.dart';
import 'selaty/splash/presentation/views/splash_screen.dart';


final navigatiorKey = GlobalKey<NavigatorState>();

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  await FirebaseApi().initNotifications();

  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("f4e88561-513d-493e-a50a-c3c923613ad4");
  OneSignal.Notifications.requestPermission(true);
  // pop up => Settings , Notification Group , Channel(Urgent).
  // OneSignal.User.pushSubscription.id; //specific user


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
            home: const SplashScreen(),
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
