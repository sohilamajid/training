import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
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
              InkWell(
                onTap: () {
                  print("Confirmed: ${phoneController.text}");
                },
                child: Container(
                  height: 55.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF2ac17e),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "تأكيد",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
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
                          EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      suffixIcon: phoneController.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.cancel, color: Colors.red),
                              onPressed: () {
                                phoneController.clear();
                                setState(() {}); // Refresh UI
                              },
                            )
                          : null,
                    ),
                    initialCountryCode: 'SA',
                    languageCode: 'en',
                    dropdownIcon: Icon(Icons.arrow_drop_down, color: Colors.black),
                    onChanged: (phone) {
                      print(phone
                          .completeNumber); // Full number with country code
                      setState(() {}); // Update the clear button visibility
                    }),
              ),
            );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        "تحقق من رقم الهاتف",
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
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
