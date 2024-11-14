import 'package:flutter/material.dart';
import 'package:movie/features/presentation/screens/home_screen/bottom_navigator_body.dart';
import '../../tabs/browse_tab/views/browse_tab.dart';
import '../../tabs/home_tab/views/home_tab.dart';
import '../../tabs/search_tab/views/search_tab.dart';
import '../../tabs/watchlist_tab/views/wtachlist_tab.dart';

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
