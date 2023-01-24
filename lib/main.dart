import 'package:flutter/material.dart';
import 'package:lumilite/screens/landing.dart';
import 'package:lumilite/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Lumi Lite',
      theme: AppTheme.lightMode(context),
      home: const LandingScreen());
}
