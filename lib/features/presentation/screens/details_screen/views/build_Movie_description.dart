import 'package:flutter/material.dart';

import '../data/model/MoveDetilsModel.dart';

class BuildMovieDescription extends StatelessWidget {
  const BuildMovieDescription({
    super.key,
    required this.movieDetailsModel,
  });

  final MovieDetailsModel movieDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 5,
              runSpacing: 7.0,
              children: [
                buildGenres(index: 0),
                buildGenres(index: 1),
                buildGenres(index: 2),
                buildGenres(index: 3),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.5,
              child: Text(
                movieDetailsModel.overview ?? "",
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            buildVoteMovie(),
          ],
        ),
      ),
    );
  }

  Container buildGenres({int index = 0}) {
    final safeIndex = (movieDetailsModel.genres != null &&
        index >= 0 &&
        index < (movieDetailsModel.genres?.length ?? 0))
        ? index
        : 0;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "${movieDetailsModel.genres?[safeIndex].name ?? 0}",
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Row buildVoteMovie() {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        Text(
          "${movieDetailsModel.voteAverage ?? ""}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
