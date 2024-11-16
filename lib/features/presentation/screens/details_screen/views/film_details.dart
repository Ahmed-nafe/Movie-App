import 'package:flutter/material.dart';
import 'film_description.dart';
import 'more_like_section.dart';

class FilmDetails extends StatelessWidget {
  const FilmDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        // left: 22.0,
        top: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 22.0),
            child: FilmDescription(),
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
