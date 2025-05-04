import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:selaty/const.dart';
import 'package:selaty/selaty/shared_widgets/custom_app_bar.dart';
import 'package:selaty/selaty/shared_widgets/custom_button/custom_button.dart';
import 'package:selaty/selaty/verification/otp_screen.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const CustomAppBar(title: "تحقق من رقم الهاتف"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              const Text(
                "لقد أرسلنا لك رسالة نصية قصيرة تحتوي على رمز الى \n رقم 96656123548",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                ),
              ),
              _buildIntlPhoneField(),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                text: "تأكيد",
                color: AppColors.greenColor,
                width: double.infinity,
                onTap: () {
                  Get.to(const OTPCodeScreen());
                  print("Confirmed: ${phoneController.text}");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntlPhoneField() {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: IntlPhoneField(
            controller: phoneController,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              border: OutlineInputBorder(
                borderSide: const BorderSide(),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.blue),
              ),
              suffixIcon: phoneController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.cancel, color: Colors.red),
                      onPressed: () {
                        phoneController.clear();
                        setState(() {}); // Refresh UI
                      },
                    )
                  : null,
            ),
            initialCountryCode: 'SA',
            languageCode: 'en',
            dropdownIcon:
                const Icon(Icons.arrow_drop_down, color: Colors.black),
            onChanged: (phone) {
              print(phone.completeNumber); // Full number with country code
              setState(() {}); // Update the clear button visibility
            }),
      ),
    );
  }
}
