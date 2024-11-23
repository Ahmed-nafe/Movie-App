import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/features/presentation/screens/home_tab/data/model/RecommendedModel.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/cached_network_image.dart';
import '../../../../../core/utils/movie_rating.dart';
import '../../../../../core/utils/shimmer_container.dart';
import '../../watchlist_screen/manger/movie_watch_list_cubit.dart';

class BuildRecommendedMovie extends StatelessWidget {
  BuildRecommendedMovie({
    super.key,
    required this.result,
  });

  final Results? result;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.detailsView,
              extra: result?.id,
            );
          },
          child: Container(
            color: const Color(0xff343534),
            margin: const EdgeInsets.only(
              right: 2.2,
              bottom: 10,
              left: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: BuildCachedNetworkImage(
                    fit: BoxFit.fill,
                    posterURL: result?.posterPath ?? "",
                    shimmerContainer: const ShimmerContainer(
                      width: 150,
                      height: 120,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, bottom: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieRating(voteAverage: "${result?.voteAverage ?? 0.0}"),
                      Text(
                        (result?.originalTitle ?? "").length > 10
                            ? "${result?.originalTitle?.substring(0, 10)}..."
                            : result?.originalTitle ?? "",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        BlocBuilder<MovieWatchListCubit, MovieWatchListState>(
          builder: (context, state) {
            final cubit = context.read<MovieWatchListCubit>();
            final isInWatchList =
                cubit.movieList.any((movie) => movie.id == result?.id);

            return Positioned(
              left: 11,
              child: GestureDetector(
                onTap: () {
                  if (isInWatchList) {
                    cubit.removeTodoItemsToList(result!.id!);
                  } else {
                    cubit.addTodoItemsToList(result!);
                  }
                },
                child: SizedBox(
                  height: 32,
                  width: 24,
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/Icons/bookmark.png",
                        color: isInWatchList ? Colors.yellow : Colors.grey,
                      ),
                      Center(
                        child: Icon(
                          isInWatchList ? Icons.done : Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
