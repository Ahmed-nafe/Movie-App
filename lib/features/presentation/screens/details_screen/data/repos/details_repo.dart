import 'package:dartz/dartz.dart';
import 'package:movie/features/presentation/screens/details_screen/data/model/MoreLikeModel.dart';

import '../../../../../../core/utils/errors.dart';
import '../model/MoveDetilsModel.dart';

abstract class DetailsRepo {
  Future<Either<Failure, MovieDetailsModel>> fetchDetailsMovie(
      {required int movieId});

  Future<Either<Failure, MoreLikeModel>> fetchMoreLikeMovie(
      {required int movieId});
}
