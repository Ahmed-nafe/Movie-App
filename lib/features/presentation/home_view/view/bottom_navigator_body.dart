import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_app.dart';

class BottomNavigatorBody extends StatelessWidget {
  BottomNavigatorBody(
      {super.key, required this.selectedTabIndex, required this.onTabChanged});

  int selectedTabIndex = 0;
  final Function(int) onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: const Color(0xff1A1A1A),
      ),
      child: BottomNavigationBar(
        onTap: onTabChanged,
        currentIndex: selectedTabIndex,
        selectedIconTheme: const IconThemeData(
            color: Colors.black,
            size: 50,
            applyTextScaling: true,
            opacity: 100),
        unselectedIconTheme: const IconThemeData(
          color: Colors.black,
          size: 50,
          applyTextScaling: true,
          opacity: 50,
        ),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: const Color(0xffAAAAAA),
        type: BottomNavigationBarType.fixed,
        items: [
          bottomNavigationBarItem(
            index: 0,
            name: "home",
            imageUrl: AssetsApp.ic_Home,
          ),
          bottomNavigationBarItem(
            index: 1,
            name: "search",
            imageUrl: AssetsApp.ic_Search,
          ),
          bottomNavigationBarItem(
            index: 2,
            name: "browse",
            imageUrl: AssetsApp.ic_Browser,
          ),
          bottomNavigationBarItem(
            imageUrl: AssetsApp.ic_BookMarks,
            name: "watchlist",
            index: 3,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(
      {required int index, required String name, required String imageUrl}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        imageUrl,
        color: selectedTabIndex == index
            ? const Color(0xffFFBB3B)
            : Colors.white,
      ),
      label: name.toUpperCase(),
    );
  }
}
