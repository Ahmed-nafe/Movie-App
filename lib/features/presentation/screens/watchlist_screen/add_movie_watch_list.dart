import 'package:flutter/material.dart';

class AddMovieToWatchList extends StatelessWidget {
   AddMovieToWatchList({
    super.key,
     required this.left
  });
  double left;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
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
    );
  }
}
