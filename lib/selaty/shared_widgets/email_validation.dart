import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../login/widgets/custom_text_field.dart';

class CustomEmailValidation extends StatelessWidget {
  CustomEmailValidation({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Form(
      key: _formKey,
      child: CustomTextField(
        height: height.h,
        controller: _emailController,
        text: "عنوان البريد الإلكتروني",
        isEmail: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "هذا الحقل فارغ";
          }
          if (value.length < 11) {
            return "البريد الإلكتروني قصير جدا";
          }
          bool emailValid = RegExp(
              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
              .hasMatch(value);
          if (!emailValid) {
            return "صيغة البريد الإلكتروني غير صحيحة";
          }
          return null;
        },
      ),
    );
  }
}
