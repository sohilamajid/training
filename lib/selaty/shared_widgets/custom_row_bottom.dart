import 'package:flutter/material.dart';
class CustomBottomRow extends StatelessWidget {
  final void Function()? onTap ;
  const CustomBottomRow({
    super.key, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "لديك حساب بالفعل؟",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        const Icon(Icons.arrow_left_outlined,
            size: 40, color: Colors.black),
        InkWell(
          onTap: onTap ,
          child: const Text(
            "تسجيل الدخول",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}