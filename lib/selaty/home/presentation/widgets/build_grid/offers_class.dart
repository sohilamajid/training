import 'package:flutter/material.dart';

class Offers {
  final String title;
  final String? centerTitle;
  final String? subtitle;
  final Color backgroundColor;

  final double? titleFontSize;
  final double? centerFontSize;
  final double? subtitleFontSize;

  final Color? centerColor;
  final Color? subtitleColor;

  final FontWeight? centerFontWeight;
  final FontWeight? subFontWeight;

  Offers({
    required this.title,
    this.centerTitle,
    this.subtitle,
    this.titleFontSize,
    this.centerFontSize,
    this.subtitleFontSize,
    this.centerColor,
    this.subtitleColor,
    this.centerFontWeight, this.subFontWeight,
    required this.backgroundColor,
  });
}