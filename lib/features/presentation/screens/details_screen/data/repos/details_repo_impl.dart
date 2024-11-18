import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/utils/api_manger.dart';

import 'package:movie/core/utils/errors.dart';

import 'package:movie/features/presentation/screens/details_screen/data/model/MoveDetilsModel.dart';

import 'details_repo.dart';

class DetailsRepoImpl implements DetailsRepo {
  ApiManger apiManger;

  DetailsRepoImpl(this.apiManger);

  @override
  Future<Either<Failure, MovieDetailsModel>> fetchDetailsMovie(
      {required int movieId}) async {
    try {
      var response = await apiManger.get(endPoint: "$movieId");

      MovieDetailsModel movieDetailsModel =
          MovieDetailsModel.fromJson(response);
      return right(movieDetailsModel);
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
