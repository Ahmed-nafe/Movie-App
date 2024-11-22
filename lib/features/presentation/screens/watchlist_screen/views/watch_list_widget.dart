import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/assets_app.dart';
import '../manger/movie_watch_list_cubit.dart';
import 'build_watch_list_movie.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MovieWatchListCubit, MovieWatchListState>(
        builder: (context, state) {
          if (state is MovieWatchListSucceed) {
            if (state.watchList.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AssetsApp.searchNotFound),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'No Movies Found',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: state.watchList.length,
              itemBuilder: (context, index) {
                return BuildWatchListMovie(
                  results: state.watchList[index],
                );
              },
            );
          } else {
            return const Text(
              'No Movies Found',
              style: TextStyle(
                color: Colors.white,
              ),
            );
          }
        },
      ),
    );
  }
}
