import 'package:flutter/material.dart';
import '../data/model/category_genres_model.dart';
import 'build_genres_List.dart';

class BuildGenresMovie extends StatelessWidget {
  BuildGenresMovie({
    super.key,
    required this.categoryGenresModel,
    required this.name,
  });

  final CategoryGenresModel categoryGenresModel;
  String name;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff121312),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            name,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
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
