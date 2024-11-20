import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/cached_network_image.dart';
import 'package:movie/core/utils/movie_rating.dart';
import 'package:movie/core/utils/shimmer_container.dart';
import 'package:movie/features/presentation/screens/home_tab/data/model/RecommendedModel.dart';
import 'package:movie/features/presentation/screens/watchlist_screen/add_movie_watch_list.dart';
import '../../../../../core/utils/app_router.dart';

class BuildRecommendedMovie extends StatelessWidget {
  const BuildRecommendedMovie({
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
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
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
                      fit: BoxFit.cover,
                      posterURL: result?.posterPath ?? "",
                      shimmerContainer: const ShimmerContainer(
                        width: 100,
                        height: 150,
                      )),
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
        AddMovieToWatchList(left: 12),
      ],
    );
  }
}
