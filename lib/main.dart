import 'package:flutter/material.dart';
import 'package:lumilite/models/category.dart';
import 'package:lumilite/screens/home.dart';
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
          ChangeNotifierProvider(create: (context) => CategoryModel()),
        ],
        child: MaterialApp(
            title: 'Lumi Lite',
            theme: AppTheme.lightMode(context),
            home: const HomeScreen()),
      );
}
