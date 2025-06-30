import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final double height;
  final String text;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool? isPassword;
  final bool? isEmail; // Added email flag
  final void Function(String)? onChanged; // OnChanged function

  const CustomTextField({
    super.key,
    required this.height,
    required this.text,
    this.validator,
    required this.controller,
    this.isPassword,
    this.isEmail,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  bool _emailValid = false; // Tracks email validation

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.isEmail == true) {
        _validateEmail(widget.controller.text);
      }
      setState(() {}); // Updates bold text when user types
    });
  }

  void _validateEmail(String input) {
    final bool isValid = RegExp(
        r"(^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$)|(^[0-9]{10,15}$)"
    ).hasMatch(input);
    if (isValid != _emailValid) {
      setState(() {
        _emailValid = isValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: widget.height * .01),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.isPassword != null ? _obscureText : false,
          onChanged: (value) {
            widget.onChanged?.call(value);
            if (widget.isEmail == true) {
              _validateEmail(value);
            }
            setState(() {}); // Updates bold style
          },
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: widget.controller.text.isNotEmpty
                ? FontWeight.bold
                : FontWeight.normal, // Bold when typed
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFFE0E0E0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFF6F6C8F), width: 1.5),
            ),
            suffixIcon: widget.isPassword != null
                ? InkWell(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText
                          ? CupertinoIcons.eye_fill
                          : CupertinoIcons.eye_slash_fill,
                    ),
                  )
                : widget.isEmail == true && _emailValid
                    ? Icon(Icons.check_circle_outline, color: Colors.green)
                    : null, // Email validation icon
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
