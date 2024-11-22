import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/presentation/screens/home_tab/manger/new_releses_cubit/new_releases_cubit.dart';
import 'package:movie/features/presentation/screens/home_tab/manger/popular_cuibt/popular_cubit.dart';
import 'package:movie/features/presentation/screens/home_tab/manger/recommended_cubit/recommended_cubit.dart';
import 'package:movie/features/presentation/screens/home_tab/views/recommend_section.dart';
import 'package:movie/features/presentation/screens/home_tab/views/top_section_item.dart';
import 'new_releases_section.dart';

class HomeTabBody extends StatefulWidget {
  const HomeTabBody({super.key});

  @override
  State<HomeTabBody> createState() => _HomeTabBodyState();
}

class _HomeTabBodyState extends State<HomeTabBody> {
  Future<void> _refreshPage() async {
    context.read<PopularCubit>().fetchPopularMovies();
    context.read<NewReleasesCubit>().fetchNewReleases();
    context.read<RecommendedCubit>().fetchRecommended();
    await Future.delayed(const Duration(seconds: 2)); // محاكاة انتظار البيانات
    // print("Page refreshed");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: Colors.blue,
      onRefresh: _refreshPage,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: const [
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
          ),
        ],
      ),
    );
  }
}
