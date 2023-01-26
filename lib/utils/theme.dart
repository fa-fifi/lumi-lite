import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightMode(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white, foregroundColor: Colors.black),
        primaryColor: const Color(0xFF3353DC),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      );
}
