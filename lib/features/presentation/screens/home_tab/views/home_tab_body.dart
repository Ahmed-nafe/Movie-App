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
          Stack(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.28,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/Image.png'),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 90,
              bottom: 30,
            ),
            child: NewReleasesSection(),
          ),
          const RecommendSection(),
        ],
      ),
    );
  }
}
