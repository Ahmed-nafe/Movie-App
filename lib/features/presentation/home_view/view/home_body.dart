import 'package:flutter/material.dart';
import '../../screens/browse_screen/views/browse_tab.dart';
import '../../screens/home_tab/views/home_tab.dart';
import '../../screens/search_screen/view/search_tab.dart';
import '../../screens/watchlist_screen/views/watch_list_tab.dart';
import 'bottom_navigator_body.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int selectedTabIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const SearchTab(),
    const BrowseTab(),
    const WatchList()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedTabIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigatorBody(
        selectedTabIndex: selectedTabIndex,
        onTabChanged: (index) {
          selectedTabIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
