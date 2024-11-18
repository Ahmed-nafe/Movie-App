import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/features/presentation/screens/details_screen/data/model/MoreLikeModel.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/shimmer_container.dart';
import '../../watchlist_screen/add_movie_watch_list.dart';

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
                    width: MediaQuery.sizeOf(context).width * 0.26,
                    imageUrl:
                        "https://image.tmdb.org/t/p/original/${result?.posterPath ?? ""}",
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const ShimmerContainer(width: 100, height: 150),
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
                      buildVoteModel(),
                      Text(
                        (result?.originalTitle ?? "").length > 20
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
        AddMovieToWatchList(
          left: 12,
        ),
      ],
    );
  }

  Row buildVoteModel() {
    return Row(
      children: [
        Text(
          "${result?.voteAverage ?? ""}".length > 4
              ? "${result?.voteAverage ?? ""}".substring(0, 4)
              : "${result?.voteAverage ?? ""}",
          softWrap: true,
          maxLines: 2,
          style: const TextStyle(color: Colors.white),
        ),
        const Icon(
          Icons.star,
          color: Colors.yellow,
        )
      ],
    );
  }
}
