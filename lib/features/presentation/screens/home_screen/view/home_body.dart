import 'package:flutter/material.dart';
import 'package:movie/features/presentation/screens/home_screen/view/bottom_navigator_body.dart';
import '../../browse_screen/views/browse_tab.dart';
import '../../home_tab/views/home_tab.dart';
import '../../search_screen/view/search_tab.dart';
import '../../watchlist_screen/views/watch_list_tab.dart';

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
