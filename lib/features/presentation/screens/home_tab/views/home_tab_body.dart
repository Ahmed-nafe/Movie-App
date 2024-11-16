import 'package:flutter/material.dart';
import 'package:movie/features/presentation/screens/home_tab/views/recommend_section.dart';
import 'package:movie/features/presentation/screens/home_tab/views/top_section_item.dart';
import 'new_releases_section.dart';

class HomeTabBody extends StatelessWidget {
  const HomeTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          TopSectionItem(),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 16,
            ),
            child: NewReleasesSection(),
          ),
          RecommendSection(),
        ],
      ),
    );
  }
}
