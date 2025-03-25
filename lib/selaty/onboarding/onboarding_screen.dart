import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  final String image, title, description;
  final Color? lightColor, mediumColor, darkColor;

  const OnBoardingScreen({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.lightColor,
    required this.mediumColor,
    required this.darkColor,
  });

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            bool isPortrait = orientation == Orientation.portrait;
            // return orientation == Orientation.portrait
            //     ? _buildPortrait()
            //     : _buildLandscape();
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Flex(
                direction: isPortrait ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image Section
                  Align(
                      alignment: Alignment.center,
                      child: _buildImage()
                  ),
                  SizedBox(
                      width: isPortrait ? 0 : 20.w,
                      height: isPortrait ? 50.h : 0),
                  // Text Section
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: isPortrait ? 27.sp : 18.sp,
                            color: widget.darkColor,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          widget.description,
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: isPortrait ? 17.sp : 13.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }

  /// another way
  // Widget _buildLandscape() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Expanded(
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               // Image Section
  //               _buildImage(),
  //
  //               SizedBox(width: 20.w),
  //
  //               // Text Section
  //               Flexible(
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       widget.title,
  //                       style: TextStyle(
  //                         fontSize: 18.sp,
  //                         color: widget.darkColor,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                       textAlign: TextAlign.start,
  //                       maxLines: 1,
  //                       overflow: TextOverflow.ellipsis,
  //                     ),
  //                     SizedBox(height: 8.h),
  //                     Text(
  //                       widget.description,
  //                       textAlign: TextAlign.start,
  //                       style: TextStyle(
  //                         fontSize: 13.sp,
  //                         color: Colors.black,
  //                       ),
  //                       maxLines: 2,
  //                       overflow: TextOverflow.ellipsis,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildPortrait() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 100.0),
  //     child: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           _buildImage(),
  //           SizedBox(height: 70.h),
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.end,
  //             children: [
  //               Text(
  //                 widget.title,
  //                 style: TextStyle(
  //                   fontSize: 28,
  //                   color: widget.darkColor,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //                 textDirection: TextDirection.rtl,
  //                 textAlign: TextAlign.center,
  //               ),
  //               Text(
  //                 widget.description,
  //                 textAlign: TextAlign.start,
  //                 style: TextStyle(
  //                   fontSize: 18,
  //                   color: Colors.black,
  //                 ),
  //                 textDirection: TextDirection.rtl,
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildImage() {
    return CircleAvatar(
      backgroundColor: widget.lightColor,
      radius: 100.r,
      child: CircleAvatar(
        backgroundColor: widget.mediumColor,
        radius: 80.r,
        child: CircleAvatar(
          backgroundColor: widget.darkColor,
          radius: 60.r,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.asset(
              widget.image,
              width: 60.r,
              height: 60.r,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
