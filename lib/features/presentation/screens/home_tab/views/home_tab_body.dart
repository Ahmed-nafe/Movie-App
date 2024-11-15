import 'package:flutter/material.dart';
import 'package:movie/features/presentation/screens/home_tab/views/recommend_section.dart';
import 'new_releases_section.dart';

class HomeTabBody extends StatelessWidget {
  const HomeTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Image.asset(
            fit: BoxFit.fill,
            "assets/Image.png",
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.28,
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 90,
              bottom: 30,
            ),
            child: NewReleasesSection(),
          ),
          const RecommendSection()
        ],
      ),
    );
  }
}
