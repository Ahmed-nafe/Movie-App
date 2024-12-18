
import 'package:flutter/material.dart';

class AppColors {
  static  const Color backgroundColor = Colors.black;
  static  const Color primaryColor = Color(0xffFFBB3B);
  static  const Color shadeGray = Color(0xff282A28);
  static const int _orangePrimaryValue = 0xFFF4B338;
  static const MaterialColor kPrimaryColor = MaterialColor(
    _orangePrimaryValue,
    <int, Color>{
      50: Color(0xFFFFF9E3),
      100: Color(0xFFFFF1B6),
      200: Color(0xFFFFE886),
      300: Color(0xFFFFE05F),
      400: Color(0xFFFFD63F),
      500: Color(_orangePrimaryValue),
      600: Color(0xFFF4A325),
      700: Color(0xFFF4931E),
      800: Color(0xFFF37C18),
      900: Color(0xFFF2690D),
    },
  );
}