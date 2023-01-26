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
  static const List<Widget> _pages = [HomeScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _pages.elementAt(_currentPage),
        // Todo: Hide bottom nav bar during scroll up.
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          onTap: (index) => setState(() => _currentPage = index),
          items: const [
            // Todo: Change icon.
            BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      );
}
