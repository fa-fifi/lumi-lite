import 'package:flutter/material.dart';
import 'package:lumilite/widgets/greeting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(initialIndex: _currentIndex, length: 3, vsync: this);
  bool _swipeIsInProgress = false;
  bool _tapIsBeingExecuted = false;
  int _currentIndex = 0;
  int _previousIndex = 0;

  Widget buildTab({required int index, required String text}) => Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: ShapeDecoration(
          color: _currentIndex == index
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColor.withOpacity(0.2),
          shape: const StadiumBorder()),
      child: Tab(text: text));

  @override
  void initState() {
    super.initState();
    _tabController.animation?.addListener(() {
      if (!_tapIsBeingExecuted &&
          !_swipeIsInProgress &&
          (_tabController.offset >= 0.5 || _tabController.offset <= -0.5)) {
        setState(() {
          _swipeIsInProgress = true;
          _previousIndex = _currentIndex;
          _currentIndex = _tabController.offset > 0
              ? _tabController.index + 1
              : _tabController.index - 1;
        });
      } else {
        if (!_tapIsBeingExecuted &&
            _swipeIsInProgress &&
            ((_tabController.offset < 0.5 && _tabController.offset > 0) ||
                (_tabController.offset > -0.5 && _tabController.offset < 0))) {
          setState(() {
            _swipeIsInProgress = false;
            _currentIndex = _previousIndex;
          });
        }
      }
    });
    _tabController.addListener(() {
      setState(() {
        _swipeIsInProgress = false;
        _currentIndex = _tabController.index;
      });
      if (_tapIsBeingExecuted == true) {
        _tapIsBeingExecuted = false;
      } else if (_tabController.indexIsChanging) {
        _tapIsBeingExecuted = true;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                pinned: true,
                expandedHeight: 125,
                flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.zero,
                    expandedTitleScale: 1,
                    background: const Greeting(),
                    title: TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.transparent,
                      labelPadding: const EdgeInsets.only(left: 10, bottom: 5),
                      isScrollable: true,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        buildTab(index: 0, text: 'Latest ⚡'),
                        buildTab(index: 1, text: 'Trending 🔥'),
                        buildTab(index: 2, text: 'News ☕'),
                      ],
                    )),
              ),
            ],
            body: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      'Tab 1 content $index',
                    ),
                  ),
                ),
                ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      'Tab 2 content $index',
                    ),
                  ),
                ),
                ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      'Tab 2 content $index',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
