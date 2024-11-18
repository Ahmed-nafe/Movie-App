import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/shimmer_container.dart';
import 'package:movie/features/presentation/screens/home_tab/data/model/RecommendedModel.dart';
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
            GoRouter.of(context).push(AppRouter.detailsView, extra: result?.id);
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
                  padding:
                      const EdgeInsets.only(left: 8.0, bottom: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                      ),
                      Text(
                        (result?.originalTitle ?? "").length > 20
                            ? "${result?.originalTitle?.substring(0, 12)}..."
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
        Positioned(
          left: 12,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 32,
              width: 24,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Icons/bookmark.png"),
                ),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
