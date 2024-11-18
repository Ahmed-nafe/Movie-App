import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/presentation/screens/browse_screen/data/model/category_list_model.dart';
import 'package:movie/features/presentation/screens/browse_screen/manger/category_list_cubit/category_list_cubit.dart';
import 'build_category_genres.dart';

class BrowseCategorySection extends StatelessWidget {
  const BrowseCategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryListCubit, CategoryListState>(
      builder: (context, state) {
        if (state is CategoryListLoading) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is CategoryListSuccess) {
          CategoryListModel categoryListModel = state.categories;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29),
              child: GridView.builder(
                itemCount: categoryListModel.genres?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 40,
                  crossAxisCount: 2,
                  mainAxisExtent: 120,
                ),
                itemBuilder: (context, index) {
                  final genres = categoryListModel.genres?[index];
                  return BuildCategoryGenres(genres: genres);
                },
              ),
            ),
          );
        }
        if (state is CategoryListError) {
          return Expanded(
            child: Center(
              child: Text(
                "Error: ${state.errorMessage}",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        } else {
          return const Text('OOPS!');
        }
      },
    );
  }
}
