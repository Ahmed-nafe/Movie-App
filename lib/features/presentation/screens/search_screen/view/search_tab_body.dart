import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/assets_app.dart';
import '../data/model/search_model.dart';
import '../manger/search_cubit.dart';
import 'bulid_search_result.dart';
import 'custom_text_field.dart';

class SearchTabBody extends StatelessWidget {
  const SearchTabBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTab(),
        Expanded(
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (context.read<SearchCubit>().searchController.text.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(AssetsApp.searchNotFound),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Please Write Name Movie Title",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                );
              }
              if (state is SearchLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is SearchError) {
                return Center(
                  child: Text(
                    "An error occurred while fetching data ,${state.errorMessage}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                );
              }
              if (state is SearchSuccess) {
                SearchModel result = state.searchModel;
                if (result.results?.isEmpty == true || result.results == null) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        width: 150,
                        AssetsApp.movieNotFound,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Movie Not Found ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                }
                return BuildListSearchResult(
                  result: result,
                );
              }
              else {
                return const Text("OOPS!");
              }
            },
          ),
        ),
      ],
    );
  }
}
