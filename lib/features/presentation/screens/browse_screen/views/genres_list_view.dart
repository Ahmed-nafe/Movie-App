import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/presentation/screens/browse_screen/data/model/category_genres_model.dart';
import 'package:movie/features/presentation/screens/browse_screen/manger/category_genres_list/category_genres_list_cubit.dart';
import 'build_genres_movie.dart';

class GenresListView extends StatelessWidget {
   GenresListView({
    super.key,
    required this.name,
  });

  String name;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryGenresListCubit, CategoryGenresListState>(
      builder: (context, state) {
        if (state is CategoryGenresListLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CategoryGenresListError) {
          return Center(child: Text('Error: ${state.error}'));
        }
        if (state is CategoryGenresListSuccess) {
          CategoryGenresModel categoryGenresModel = state.genres;
          return BuildGenresMovie(
            name: name,
              categoryGenresModel: categoryGenresModel
          );
        } else {
          return const Center(child: Text("OOPS!"));
        }
      },
    );
  }
}
