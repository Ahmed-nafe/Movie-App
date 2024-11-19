import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/server_locator.dart';
import 'package:movie/features/presentation/screens/browse_screen/data/repo/category_repo_implment.dart';
import 'package:movie/features/presentation/screens/browse_screen/manger/category_genres_list/category_genres_list_cubit.dart';
import 'genres_list_view.dart';

class GenreMoviesListScreen extends StatelessWidget {
  GenreMoviesListScreen({
    super.key,
    required this.genreId,
  });

  int genreId;

  // @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryGenresListCubit(
        getIt.get<CategoryRepoImpl>()
      )..fetchCategoryGenresList(genreID: genreId),
      child: const GenresListView(),
    );
  }
}
