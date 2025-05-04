import 'package:flutter/material.dart';
class CustomBottomRow extends StatelessWidget {
  final void Function()? onTap ;
  final String? text ;
  const CustomBottomRow({
    super.key, this.onTap, this.text,
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
          child: Text(
            text!,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}