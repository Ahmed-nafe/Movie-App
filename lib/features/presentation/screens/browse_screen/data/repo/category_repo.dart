import 'package:dartz/dartz.dart';
import 'package:movie/core/utils/errors.dart';
import 'package:movie/features/presentation/screens/browse_screen/data/model/category_genres_model.dart';
import 'package:movie/features/presentation/screens/browse_screen/data/model/category_list_model.dart';

abstract class CategoryRepo {
  Future<Either<Failure, CategoryListModel>> fetchCategoryGenresList();
  Future<Either<Failure, CategoryGenresModel>> fetchGenresID(
  {required int movieId}
      );
}
