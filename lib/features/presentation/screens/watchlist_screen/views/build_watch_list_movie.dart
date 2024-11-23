import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/app_router.dart';
import 'package:movie/features/presentation/screens/home_tab/data/model/RecommendedModel.dart';

import '../../../../../core/utils/cached_network_image.dart';
import '../../../../../core/utils/shimmer_container.dart';

class BuildWatchListMovie extends StatelessWidget {
  const BuildWatchListMovie({
    super.key,
    required this.results,
  });

  final Results results;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.5, top: 15),
      child: Column(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.detailsView,
                extra: results.id,
              );
            },
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        BuildCachedNetworkImage(
                            posterURL: results.backdropPath ?? "",
                            shimmerContainer: const ShimmerContainer(
                              width: 250,
                              height: 100,
                            ),
                            fit: BoxFit.fill),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        results.title ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "${results.releaseDate?.substring(0, 4)}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        results.originalTitle ?? "",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey.withOpacity(0.5),
            height: 30,
            endIndent: 27,
          ),
        ],
      ),
    );
  }
}
