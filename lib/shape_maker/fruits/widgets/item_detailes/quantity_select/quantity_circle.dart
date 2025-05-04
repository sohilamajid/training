import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityCircle extends StatefulWidget {
  final double? left;
  final double? bottom;
  final String text;
  final String? subtext;
  final bool isSelected;
  final VoidCallback onTap;

  const QuantityCircle({
    super.key,
    this.left,
    this.bottom,
    required this.text,
    this.subtext, required this.isSelected, required this.onTap,
  });

  @override
  State<QuantityCircle> createState() => _QuantityCircleState();
}

class _QuantityCircleState extends State<QuantityCircle> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.left,
      bottom: widget.bottom,
      child: GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: CircleAvatar(
        radius: 18.r,
        backgroundColor: widget.isSelected ? Colors.white : const Color(0xFF555656),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (widget.subtext != null)
              Text(
                widget.subtext!,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 8.sp,
                  height: .5,
                ),
              ),
          ],
        ),
          ),
      ),
    );
  }
}

