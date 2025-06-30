import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:selaty/selaty/auth/views/auth_screen.dart';
import 'package:selaty/selaty/onboarding/model/on_boarding_model.dart';
import 'package:selaty/selaty/onboarding/onboarding_screen.dart';
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
                    reverse: true,
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
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      if (currentIndex < list.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                        _completeOnBoarding();
                      } else {
                        // Handle what happens when reaching the last page (e.g., navigate to home screen)
                        Get.offAll(const AuthScreen());
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
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w,),
                ],
              ),
            ],
          ),
        )
    );
  }
  void _completeOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("onBoarding", true);
    Get.offAll(AuthScreen());
  }
}
