import 'package:flutter/material.dart';
import 'package:movie/features/presentation/screens/search_screen/data/model/search_model.dart';
import '../../../../../core/utils/cached_network_image.dart';
import '../../../../../core/utils/movie_rating.dart';
import '../../../../../core/utils/shimmer_container.dart';

class BuildSearchResult extends StatelessWidget {
  const BuildSearchResult({
    super.key,
    required this.resultData,
  });

  final Results? resultData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(15),
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: BuildCachedNetworkImage(
                  fit: BoxFit.fill,
                  shimmerContainer:
                      const ShimmerContainer(width: 100, height: 120),
                  posterURL: resultData?.backdropPath ?? ""),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      resultData?.originalTitle ?? "",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      (resultData?.releaseDate ?? "").length > 4
                          ? (resultData?.releaseDate ?? "").substring(0, 4)
                          : resultData?.releaseDate ?? "",
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    MovieRating(
                      voteAverage: "${resultData?.voteAverage}",
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
