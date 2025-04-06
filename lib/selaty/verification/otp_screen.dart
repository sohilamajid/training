import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:training/selaty/shared_widgets/custom_app_bar.dart';

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
      appBar: const CustomAppBar(title: "التحقق من الهاتف",isCenter: true),
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
                const Text(
                  "أدخل رمز OTP الخاص بك هنا",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
                _buildInput(),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("لم يصل الكود؟",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // Remove button padding
                          minimumSize: const Size(0, 0), // Prevents extra space
                        ),
                        child: const Text("إعادة إرسال رمز جديد",
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
          textStyle: const TextStyle(fontSize: 24, color: Colors.black), // Black text for white background
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
        ),
        focusedPinTheme: PinTheme(
          height: 60,
          width: 60,
          textStyle: const TextStyle(fontSize: 24, color: Colors.white), // White text for red background
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red),
          ),
        ),
      ),
    );
  }
}

