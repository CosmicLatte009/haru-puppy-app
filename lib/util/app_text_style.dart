import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle regular({double fontSize = 14}) => TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        color: Color(0xFF4A4A4A),
      );

  static TextStyle medium({double fontSize = 16}) => TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        color: Color(0xFF4A4A4A),
      );

  static TextStyle semiBold({double fontSize = 18}) => TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
        color: Color(0xFF4A4A4A),
      );
}
