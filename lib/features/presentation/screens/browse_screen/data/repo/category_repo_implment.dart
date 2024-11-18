import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/utils/api_manger.dart';
import 'package:movie/core/utils/errors.dart';
import 'package:movie/features/presentation/screens/browse_screen/data/model/category_list_model.dart';
import 'package:movie/features/presentation/screens/browse_screen/data/repo/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  ApiManger apiManger;

  CategoryRepoImpl(this.apiManger);

  @override
  Future<Either<Failure, CategoryListModel>> fetchCategoryList() async {
    try {
      var response = await apiManger.get(
          baseUrl: "https://api.themoviedb.org/3/genre/movie/",
          endPoint: "list");
      CategoryListModel categoryListModel =
          CategoryListModel.fromJson(response);
      return right(categoryListModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          ServerFailure(e.toString()),
        );
      }
    }
  }
}
