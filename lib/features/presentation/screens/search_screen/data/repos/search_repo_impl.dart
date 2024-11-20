import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/utils/api_manger.dart';
import 'package:movie/core/utils/errors.dart';
import 'package:movie/features/presentation/screens/search_screen/data/model/search_model.dart';
import 'package:movie/features/presentation/screens/search_screen/data/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  ApiManger apiManger;

  SearchRepoImpl({required this.apiManger});

  @override
  Future<Either<Failure, SearchModel>> fetchSearch(
      {required String query}) async {
    try {
      var response = await apiManger.get(
          apiKey: "&api_key=0403d62457b0709fa04b96044b5aa966",
          baseUrl: "https://api.themoviedb.org/3/search/movie",
          endPoint: "?query=$query");
      SearchModel searchModel = SearchModel.fromJson(response);
      return right(searchModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(
          ServerFailure(e.toString()),
        );
      }
    }
  }
}
