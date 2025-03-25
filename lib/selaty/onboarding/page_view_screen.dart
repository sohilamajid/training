import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:training/selaty/auth/auth_screen.dart';
import 'package:training/selaty/onboarding/model/on_boarding_model.dart';
import 'package:training/selaty/onboarding/onboarding_screen.dart';

import 'json_file/on_boarding_json.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  final List<OnBoardingModel> list =
  onBoardingData.map((e) => OnBoardingModel.fromJson(e)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).orientation == Orientation.portrait
                    ? 530.h  // Portrait mode
                    : 320.h, // Landscape mode
                child: PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return OnBoardingScreen(
                        image: list[index].image ?? "",
                        title: list[index].title ?? "",
                        description: list[index].description ?? "",
                        lightColor: list[index].lightColor ?? Colors.red,
                        mediumColor: list[index].mediumColor ?? Colors.red,
                        darkColor: list[index].darkColor ?? Colors.red,
                      );
                    }),
              ),

              // Button to go to next page
              Row(
                children: [
                  SizedBox(width: 25.w,),
                  InkWell(
                    onTap: () {
                      if (currentIndex < list.length - 1) {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        // Handle what happens when reaching the last page (e.g., navigate to home screen)
                        Get.offAll(AuthScreen());
                        print("Last Page Reached");
                      }
                    },
                    child: Container(
                      height: 45.h,
                      width: 45.h,
                      decoration: BoxDecoration(
                        color: list[currentIndex].darkColor ?? Colors.red,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: SmoothPageIndicator(
                      controller: _pageController,  // PageController
                      count: list.length,
                      axisDirection: Axis.horizontal,
                      effect:  WormEffect(
                        dotColor: Colors.grey,
                        activeDotColor: list[currentIndex].darkColor ?? Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              // Dots Indicator
              // Container(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: List.generate(
              //       list.length,
              //           (index) => buildDot(index, context),
              //     ),
              //   ),
              // ),
            ],
          ),
        ));
  }


/// page indicator without package
  // Widget buildDot(int index, BuildContext context) {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 4),
  //     width: index == currentIndex ? 12 : 8,
  //     height: index == currentIndex ? 12 : 8,
  //     decoration: BoxDecoration(
  //       shape: BoxShape.circle,
  //       color: index == currentIndex
  //           ? list[currentIndex].darkColor
  //           : Colors.grey,
  //     ),
  //   );
  // }
}
