import 'package:flutter/material.dart';
import '../data/model/category_genres_model.dart';
import 'build_genres_List.dart';

class BuildGenresMovie extends StatelessWidget {
  const BuildGenresMovie({
    super.key,
    required this.categoryGenresModel,
  });

  final CategoryGenresModel categoryGenresModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff121312),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "genres?.name ?? " "",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
          foregroundColor: Colors.blue,
        ),
        body: BuildGenresList(
          categoryGenresModel: categoryGenresModel,
        ),
      ),
    );
  }
}
