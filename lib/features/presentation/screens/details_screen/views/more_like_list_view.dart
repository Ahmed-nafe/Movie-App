import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/features/presentation/screens/details_screen/data/model/MoreLikeModel.dart';
import 'package:movie/features/presentation/screens/details_screen/manger/more_like_cubit/more_like_cubit.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/shimmer_container.dart';
import 'build_more_like_movie.dart';

class MoreLikeListView extends StatelessWidget {
  const MoreLikeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoreLikeCubit, MoreLikeState>(
      builder: (context, state) {
        if (state is MoreLikeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MoreLikeSuccess) {
          MoreLikeModel moreLikeModel = state.moreLikeModel;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moreLikeModel.results?.length,
            itemBuilder: (context, index) {
              final result = moreLikeModel.results?[index];
              return BuildMoreLikeMovie(
                result: result,
              );
            },
          );
        }
        if (state is MoreLikeError) {
          return Center(
            child: Text("Failed to load data :${state.errorMessage}"),
          );
        } else {
          return const Center(child: Text("OOPS!"));
        }
      },
    );
  }
}


