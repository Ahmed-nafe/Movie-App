import 'package:flutter/material.dart';
import '../data/model/MoveDetilsModel.dart';
import 'film_description.dart';
import 'more_like_section.dart';

class FilmDetails extends StatelessWidget {
  FilmDetails({
    super.key,
    required this.movieDetailsModel,
  });

  MovieDetailsModel movieDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        // left: 22.0,
        top: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: FilmDescription(
              movieDetailsModel: movieDetailsModel,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          MoreLikeSection()
        ],
      ),
    );
  }
}
