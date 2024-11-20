import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/utils/cached_network_image.dart';
import 'package:movie/features/presentation/screens/details_screen/data/model/MoveDetilsModel.dart';
import '../../../../../core/utils/shimmer_container.dart';
import 'build_Movie_description.dart';

class FilmDescription extends StatelessWidget {
  FilmDescription({
    super.key,
    required this.movieDetailsModel,
  });

  MovieDetailsModel movieDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movieDetailsModel.title ?? "",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          movieDetailsModel.releaseDate ?? "",
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontWeight: FontWeight.w600,
            fontSize: 10,
          ),
        ),
        const SizedBox(
          height: 19,
        ),
        Row(
          children: [
            Container(
                height: MediaQuery.sizeOf(context).height * 0.25,
                width: MediaQuery.sizeOf(context).width * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: BuildCachedNetworkImage(
                  fit: BoxFit.fill,
                  posterURL: "${movieDetailsModel.posterPath}",
                  shimmerContainer: const ShimmerContainer(
                    width: double.infinity,
                    height: 100,
                  ),
                )),
            BuildMovieDescription(
              movieDetailsModel: movieDetailsModel,
            )
          ],
        ),
      ],
    );
  }
}
