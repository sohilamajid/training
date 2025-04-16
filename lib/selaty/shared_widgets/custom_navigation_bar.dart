import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training/selaty/category/presentation/views/category_fruits_screen.dart';
import 'package:training/selaty/category/presentation/views/category_screen.dart';
import 'package:training/selaty/home/presentation/views/home_screen.dart';
import 'package:training/selaty/profile/presentation/views/profile_screen.dart';
class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    super.key,
    required this.logo,
  });

  final String logo;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _index = 0;
  final List _screens = [
    const ProfileScreen(),
    const HomeScreen(),
    const CategoryScreen(),
    const CategoryFruitScreen(),
    const HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     bottomNavigationBar: CurvedNavigationBar(
      // index: 2,
      backgroundColor: Colors.white,
      items: [
        const Icon(Icons.person_2_outlined),
        const Icon(Icons.notifications_none_outlined),
        CircleAvatar(
          radius: 22,
          // backgroundImage: AssetImage(logo),
          backgroundColor: Colors.green,
          child: Image.asset(widget.logo,height: 32.h,width: 32.w,),
        ),
        const Icon(Icons.favorite_border),
        const Icon(Icons.search),
      ],
       onTap: (index) {
         _index = index;
         setState(() {});
       },
      ),
      body: _screens[_index],
    );
  }
}