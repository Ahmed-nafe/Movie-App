import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/movie_rating.dart';
import 'package:movie/features/presentation/screens/details_screen/data/model/MoreLikeModel.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/shimmer_container.dart';

class BuildMoreLikeMovie extends StatelessWidget {
  const BuildMoreLikeMovie({
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
            GoRouter.of(context).pushReplacement(
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
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://image.tmdb.org/t/p/original/${result?.posterPath ?? ""}",
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                        child: ShimmerContainer(width: 150, height: 100)),
                    errorWidget: (context, url, error) => const SizedBox(
                      height: 100,
                      width: 150,
                      child: Center(
                        child: Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
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
      ],
    );
  }
}
