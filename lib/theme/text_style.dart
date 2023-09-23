import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();
  static TextStyle get title => const TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );
  static TextStyle get question => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );

  static TextStyle get answer => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );
  static TextStyle get button => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      );
}
