import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/shimmer.dart';
import 'package:movie/features/presentation/screens/home_tab/data/model/NewReleaseModel.dart';
import 'package:movie/features/presentation/screens/home_tab/manger/new_releses_cubit/new_releases_cubit.dart';
import 'build_new_releases_movie.dart';

class NewReleasesListView extends StatelessWidget {
  const NewReleasesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewReleasesCubit, NewReleasesState>(
      builder: (context, state) {
        if (state is NewReleasesLoading) {
          return  BuildShimmer(width: 100,height: 60,);
        }
        if (state is NewReleasesSuccess) {
          NewReleaseModel newReleaseModel = state.newReleaseModel;
          return Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 12, left: 19, bottom: 14),
              scrollDirection: Axis.horizontal,
              itemCount: newReleaseModel.results?.length,
              itemBuilder: (context, index) {
                final movieResult = newReleaseModel.results?[index];
                return BuildNewReleasesMovie(
                  result: movieResult,
                );
              },
            ),
          );
        }
        if (state is NewReleasesError) {
          return Expanded(
            child: Center(
              child: Text(
                "Error: ${state.errorMessage}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
        } else {
          return const Text("OOPS!");
        }
      },
    );
  }
}
