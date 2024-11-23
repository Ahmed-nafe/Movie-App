import 'package:flutter/material.dart';
import 'package:movie/features/presentation/screens/home_tab/data/model/RecommendedModel.dart';

class AddMovieToWatchList extends StatefulWidget {
  AddMovieToWatchList({
    super.key,
    required this.left,
    required this.movie,
    required this.cubit,
  });

  double left;
  int index = 0;
  final Results movie;
  Function(Results) cubit;

  @override
  State<AddMovieToWatchList> createState() => _AddMovieToWatchListState();
}

class _AddMovieToWatchListState extends State<AddMovieToWatchList> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.left,
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.cubit;
            widget.index = widget.index == 0 ? 1 : 0;
          });
        },
        child: SizedBox(
          height: 32,
          width: 24,
          child: Stack(
            children: [
              Image.asset(
                "assets/Icons/bookmark.png",
                color: widget.index == 0 ? Colors.grey.shade600 : Colors.yellow,
              ),
              Center(
                child: Icon(
                  widget.index == 0 ? Icons.add : Icons.done,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
