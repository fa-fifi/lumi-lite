import 'package:flutter/material.dart';
import 'package:lumilite/models/activity.dart';
import 'package:lumilite/screens/landing.dart';
import 'package:lumilite/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ActivityModel()),
        ],
        child: MaterialApp(
            title: 'Lumi Lite',
            theme: AppTheme.lightMode(context),
            home: const LandingScreen()),
      );
}
