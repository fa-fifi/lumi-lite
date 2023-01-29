import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lumilite/providers/settings.dart';
import 'package:lumilite/screens/home.dart';
import 'package:lumilite/screens/settings.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
  static final ScrollController controller = ScrollController();
  final ValueNotifier<bool> _visible = ValueNotifier(true);
  late final List<Widget> _pages = [
    HomeScreen(topics: context.watch<SettingsProvider>().topics),
    const SettingsScreen()
  ];
  int _currentPage = 0;

  @override
  void initState() {
    controller.addListener(() {
      switch (controller.position.userScrollDirection) {
        case ScrollDirection.forward:
          setState(() {
            _visible.value = true;
          });
          break;
        case ScrollDirection.reverse:
          setState(() {
            _visible.value = false;
          });
          break;
        default:
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _pages.elementAt(_currentPage),
        bottomNavigationBar: ValueListenableBuilder<bool>(
          valueListenable: _visible,
          builder: (context, value, child) => AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: value ? kBottomNavigationBarHeight : 0.0,
              child: child),
          child: Wrap(children: [
            BottomNavigationBar(
                currentIndex: _currentPage,
                selectedItemColor: Theme.of(context).primaryColor,
                onTap: (index) => setState(() => _currentPage = index),
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.feed), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings'),
                ]),
          ]),
        ),
      );
}
