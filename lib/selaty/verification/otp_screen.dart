import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OTPCodeScreen extends StatefulWidget {
  const OTPCodeScreen({super.key});

  @override
  State<OTPCodeScreen> createState() => _OTPCodeScreenState();
}

class _OTPCodeScreenState extends State<OTPCodeScreen> {
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "أدخل رمز OTP الخاص بك هنا",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
                _buildInput(),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("لم يصل الكود؟",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // Remove button padding
                          minimumSize: Size(0, 0), // Prevents extra space
                        ),
                        child: Text("إعادة إرسال رمز جديد",
                            style: TextStyle(fontSize: 16, color: Colors.red)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }










  Widget _buildInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Pinput(
        controller: _otpController,
        length: 4,
        defaultPinTheme: PinTheme(
          height: 60,
          width: 60,
          textStyle: TextStyle(fontSize: 24, color: Colors.black), // Black text for white background
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
        ),
        focusedPinTheme: PinTheme(
          height: 60,
          width: 60,
          textStyle: TextStyle(fontSize: 24, color: Colors.white), // White text for red background
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Center(
        child: Text(
          "التحقق من الهاتف",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      leading: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10),
        child: _buildAppBarIcons(icon: Icons.linked_camera_outlined),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 15),
          child: _buildAppBarIcons(icon: Icons.arrow_back_ios_new),
        ),
      ],
    );
  }

  Widget _buildAppBarIcons({
    required IconData icon,
  }) {
    return Container(
      height: 50.h,
      width: 40.w,
      child: Center(
        child: Icon(
          icon,
          color: Colors.black,
          size: 24,
        ),
      ),
    );
  }
}

