import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/const.dart';
import 'package:selaty/selaty/home/presentation/views/home_screen.dart';
import 'package:selaty/selaty/profile/presentation/views/profile_screen.dart';
class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    super.key,
    required this.logo, this.message,
  });

  static const route = '/custom-navigation-bar';

  final String logo;
  final RemoteMessage? message;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _index = 0;
  // final List _screens = [
  //   const ProfileScreen(),
  //   Container(
  //     color: Colors.white,
  //     child: Center(
  //       child: Column(
  //         children: [
  //           Text(
  //             "الاشعارات",
  //             style: TextStyle(
  //               fontSize: 50,
  //             ),
  //           ),
  //           Text('${message.notification?.title}'),
  //           Text('${message.notification?.body}'),
  //           Text('${message.data}'),
  //         ],
  //       ),
  //     ),
  //   ),
  //   const HomeScreen(),
  //   Container(
  //     color: Colors.white,
  //     child: const Center(
  //       child: Text(
  //         "المفضلة",
  //         style: TextStyle(
  //           fontSize: 50,
  //         ),
  //       ),
  //     ),
  //   ),
  //   Container(
  //     color: Colors.white,
  //     child: const Center(
  //       child: Text(
  //         "البحث",
  //         style: TextStyle(
  //           fontSize: 50,
  //         ),
  //       ),
  //     ),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    final RemoteMessage? message = widget.message;
    print('Message received on screen: $message');

    final List<Widget> screens = [
      const ProfileScreen(),
      Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "الاشعارات",
                style: TextStyle(fontSize: 50),
              ),
              if (message != null) ...[
                Text('Title: ${message.notification?.title ?? ''}'),
                Text('Body: ${message.notification?.body ?? ''}'),
                Text('Data: ${message.data.toString()}'),
              ] else
                const Text('No message data'),
            ],
          ),
        ),
      ),
      const HomeScreen(),
      const Center(
        child: Text(
          "المفضلة",
          style: TextStyle(fontSize: 50),
        ),
      ),
      const Center(
        child: Text(
          "البحث",
          style: TextStyle(fontSize: 50),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        items: [
          const Icon(Icons.person_2_outlined),
          const Icon(Icons.notifications_none_outlined),
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.green,
            child: Image.asset(widget.logo, height: 32.h, width: 32.w),
          ),
          const Icon(Icons.favorite_border),
          const Icon(Icons.search),
        ],
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      body: screens[_index],
    );
  }
}