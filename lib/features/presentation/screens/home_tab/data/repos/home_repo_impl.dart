import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/utils/api_manger.dart';
import 'package:movie/core/utils/errors.dart';
import 'package:movie/features/presentation/screens/home_tab/data/model/RecommendedModel.dart';
import '../model/NewReleaseModel.dart';
import 'package:movie/features/presentation/screens/home_tab/data/repos/home_repo.dart';

class HomeRepoImplement implements HomeRepo {
  ApiManger apiManger;

  HomeRepoImplement(
    this.apiManger,
  );

  @override
  Future<Either<Failure, NewReleaseModel>> fetchNewReleases() async {
    try {
      var response = await apiManger.get(
          endPoint: "upcoming?api_key=0403d62457b0709fa04b96044b5aa966");
      NewReleaseModel newReleasesModel = NewReleaseModel.fromJson(response);
      return right(newReleasesModel);
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

  @override
  Future<Either<Failure, RecommendedModel>> fetchRecommended() async {
    try {
      var response = await apiManger.get(
          endPoint: "top_rated?api_key=0403d62457b0709fa04b96044b5aa966");
      print("Ahmed Nafe :$response");
      RecommendedModel recommendedModel = RecommendedModel.fromJson(response);
      return right(recommendedModel);
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
