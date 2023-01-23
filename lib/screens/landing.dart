import 'package:flutter/material.dart';
import 'package:lumilite/screens/home.dart';
import 'package:lumilite/screens/settings.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _currentPage = 0;
  static const List<Widget> _screens = [HomeScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _screens.elementAt(_currentPage),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          onTap: (index) => setState(() => _currentPage = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      );
}
