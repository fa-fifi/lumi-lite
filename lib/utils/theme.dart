import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightMode(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF3353DC),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black),
      );
}
