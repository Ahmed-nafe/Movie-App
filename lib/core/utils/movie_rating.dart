import 'package:flutter/material.dart';

class MovieRating extends StatelessWidget {
  const MovieRating({
    super.key,
    required this.voteAverage,
  });

  final String voteAverage;

  // final Results? resultData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          voteAverage.length > 4
              ? voteAverage.substring(0, 4)
              :voteAverage,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      ],
    );
  }
}
