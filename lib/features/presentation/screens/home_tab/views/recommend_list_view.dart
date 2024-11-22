import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/presentation/screens/home_tab/data/model/RecommendedModel.dart';
import 'package:movie/features/presentation/screens/home_tab/manger/recommended_cubit/recommended_cubit.dart';
import 'package:movie/features/presentation/screens/home_tab/views/build_recommended_movie.dart';

class RecommendListView extends StatelessWidget {
  const RecommendListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedCubit, RecommendedState>(
      builder: (context, state) {
        if (state is RecommendedLoading) {
          return const Expanded(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is RecommendedSuccess) {
          RecommendedModel recommendedModel = state.recommendedModel;

          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recommendedModel.results?.length,
              itemBuilder: (context, index) {
                final result = recommendedModel.results?[index];
                return BuildRecommendedMovie(
                  result: result,
                );
              },
            ),
          );
        }
        if (state is RecommendedError) {
          return Expanded(
              child: Center(
                  child: Text(
            "Error : ${state.errorMessage}",
            style: const TextStyle(fontSize: 18, color: Colors.white),
          )));
        } else {
          return const Text("OOPS!");
        }
      },
    );
  }
}
