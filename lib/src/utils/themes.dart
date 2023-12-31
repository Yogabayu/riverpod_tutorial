import 'package:flutter/material.dart';

class Themes {
  static Color lightPrimary = Colors.white;
  static Color darkPrimary = Color(0xff1f1f1f);
  static Color lightAccent = Color(0xff06d6a7);
  static Color darkAccent = Color(0xff06d6a7);
  static Color lightBG = Colors.white;
  static Color darkBG = Color(0xff121212);

  static ThemeData lightTheme = ThemeData(
    // ignore: deprecated_member_use
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    hintColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    // ignore: deprecated_member_use
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    hintColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
    ),
  );

  static BoxShadow cardShadow = BoxShadow(
    color: Colors.grey[300]!.withOpacity(0.8),
    blurRadius: 8.0,
    spreadRadius: 0.0,
    offset: Offset(
      0.0,
      2.0,
    ),
  );
}
